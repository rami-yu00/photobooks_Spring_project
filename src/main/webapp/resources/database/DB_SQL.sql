/*  
PhotoBooks : �ν�Ÿ�׷� ��ġ��ŷ �����������ӿ�ũ�� Ȱ���� Ŀ�´�Ƽ ������Ʈ ����� ������Ʈ

[ TABLE ] 
        
			    *-- �⺻ Id / pwd --------------------------------*
			        
			        user72 / 1234
			        
			      * ���� id�� user01 ���� user84���� ������ 
			      * ��й�ȣ�� 1234 �� ��ü �����մϴ�.         
			      
			    *-----------------------------------------------*
    
    ȸ������
        - pb_users [ user_no / user_email / user_id / user_pwd / user_reg_date ]
        - pb_users_profile [ user_profile_no / user_no / user_name / user_intro ]
        - pb_users_img  [ user_img_no / user_no / user_img_name ]
        - pb_follow  [ follow_no / active_user_no / passive_user_no ]
        
    ����Ʈ����
        - pb_post [ post_no / post_caption / post_reg_date / user_no / post_file_count ]
        - pb_post_file [ post_file_no / post_no / post_file_name ]
        - pb_reply [ reply_no / user_no / post_no / reply_reg_date / content ]
        - pb_like [ like_no / user_no / post_no ]
        - pb_post_tag [ post_no / tag_no ] ��ɱ��� ����
        
    �˻����� : ��ɱ��� ����
        - pb_tag [ tag_no / tag_name ]
        
*/
------------------------------------------------[ SQL DDL ]------------------------------------------------

DROP TABLE pb_post_tag ; 
DROP TABLE pb_tag ; DROP SEQUENCE pb_tagSeq ;
DROP TABLE pb_like ;  DROP SEQUENCE pb_likeSeq ;
DROP TABLE pb_reply ; DROP SEQUENCE pb_replySeq ;
DROP TABLE pb_post_file;  DROP SEQUENCE pb_post_fileSeq ;
DROP TABLE pb_post ; DROP SEQUENCE pb_postSeq ;
DROP TABLE pb_follow ; DROP SEQUENCE pb_followSeq ;
DROP TABLE pb_users_img ; DROP SEQUENCE pb_users_imgSeq ;
DROP TABLE pb_users_profile; DROP SEQUENCE pb_users_profileSeq;
DROP TABLE pb_users ; DROP SEQUENCE pb_usersSeq ;
commit;

--[ pb_users ]

  CREATE TABLE pb_users(
    user_no NUMBER PRIMARY KEY , -- �����ĺ���ȣ
    user_email VARCHAR2(80) UNIQUE ,
    user_id VARCHAR2(20) UNIQUE ,
    user_pwd VARCHAR2(20) NOT NULL ,
    user_reg_date DATE DEFAULT sysdate -- ��������
  );
  
--[ pb_users ] SEQUENCE
  CREATE SEQUENCE pb_usersSeq ;
  
------------------------------------------------------------------------------------------------------------
--[ pb_users_profile ]

  CREATE TABLE pb_users_profile(
    user_profile_no NUMBER PRIMARY KEY,
    user_no NUMBER UNIQUE ,
    user_name VARCHAR2(20) , -- ������̸�
    user_intro VARCHAR2(3000),   -- �ڱ�Ұ���
   CONSTRAINT pb_users_profile_fk FOREIGN KEY(user_no) REFERENCES pb_users(user_no) ON DELETE CASCADE
  );
  
--[ pb_users_profile ] SEQUENCE
  CREATE SEQUENCE pb_users_profileSeq;
  
------------------------------------------------------------------------------------------------------------
--[ pb_users_img ]

  CREATE TABLE pb_users_img(
    user_img_no NUMBER PRIMARY KEY , 
    user_no NUMBER NOT NULL , -- ȸ����ȣ 
    user_img_name VARCHAR2(240) UNIQUE , 
    CONSTRAINT pb_users_img_fk FOREIGN KEY(user_no) REFERENCES pb_users(user_no) ON DELETE CASCADE
  );
  
--[ pb_users_img ] SEQUENCE
  CREATE SEQUENCE pb_users_imgSeq ;
  
------------------------------------------------------------------------------------------------------------  
--[ pb_follow ]

  CREATE TABLE pb_follow (
    follow_no NUMBER PRIMARY KEY ,
    active_user_no NUMBER NOT NULL ,
    passive_user_no NUMBER NOT NULL ,
    CONSTRAINT pb_follow_active_fk FOREIGN KEY(active_user_no) REFERENCES pb_users(user_no) ON DELETE CASCADE ,
    CONSTRAINT pb_follow_passive_fk FOREIGN KEY(passive_user_no) REFERENCES pb_users(user_no) ON DELETE CASCADE
  );
  
--[ pb_follow ] SEQUENCE
  CREATE SEQUENCE pb_followSeq ;
  
------------------------------------------------------------------------------------------------------------
--[ pb_post ]

  CREATE TABLE pb_post (
    post_no NUMBER PRIMARY KEY ,
    post_caption VARCHAR2(3000) NOT NULL , -- ����Ʈ����(�Խñ�)
    post_reg_date DATE DEFAULT sysdate ,
    user_no NUMBER NOT NULL ,
    post_file_count NUMBER NOT NULL,
    CONSTRAINT pb_post_fk FOREIGN KEY(user_no) REFERENCES pb_users(user_no) ON DELETE CASCADE
  );
  
--[ pb_post ] SEQUENCE
  CREATE SEQUENCE pb_postSeq ;
  
------------------------------------------------------------------------------------------------------------
--[ pb_post_file ]

  CREATE TABLE pb_post_file(
    post_file_no NUMBER PRIMARY KEY,
    post_no NUMBER NOT NULL,
    post_file_name VARCHAR2(240) UNIQUE ,
    CONSTRAINT pb_post_file_fk FOREIGN KEY(post_no) REFERENCES pb_post(post_no) ON DELETE CASCADE
  );
  
--[ pb_post_file ] SEQUENCE
  CREATE SEQUENCE pb_post_fileSeq ;

------------------------------------------------------------------------------------------------------------
--[ pb_reply ]

  CREATE TABLE pb_reply(
    reply_no NUMBER PRIMARY KEY ,
    user_no NUMBER NOT NULL ,
    post_no NUMBER NOT NULL ,
    reply_reg_date DATE DEFAULT sysdate ,
    content VARCHAR2(500) NOT NULL ,
    CONSTRAINT pb_reply_user_fk FOREIGN KEY(user_no) REFERENCES pb_users(user_no) ON DELETE CASCADE ,
    CONSTRAINT pb_reply_post_fk FOREIGN KEY(post_no) REFERENCES pb_post(post_no) ON DELETE CASCADE
  );
  
--[ pb_reply ] SEQUENCE
  CREATE SEQUENCE pb_replySeq ;

------------------------------------------------------------------------------------------------------------
--[ pb_like ]


create table pb_like(
  like_no number primary key ,
  user_no number not null ,
  post_no number not null ,
  CONSTRAINT pb_like_user_fk foreign key(user_no) references pb_users(user_no) on delete cascade ,
  CONSTRAINT pb_like_post_fk foreign key(post_no) references pb_post(post_no) on delete cascade
);
  
--[ pb_like ] SEQUENCE
  CREATE SEQUENCE pb_likeSeq ;

------------------------------------------------------------------------------------------------------------
--[ pb_tag ] ��ɱ��� ����

  CREATE TABLE pb_tag(
    tag_no NUMBER PRIMARY KEY ,
    tag_name VARCHAR2(50) UNIQUE
  );
  
--[ pb_tag ] SEQUENCE
  CREATE SEQUENCE pb_tagSeq ;

------------------------------------------------------------------------------------------------------------
--[ pb_post_tag ] ��ɱ��� ����

  CREATE TABLE pb_post_tag(
    post_no NUMBER NOT NULL ,
    tag_no NUMBER NOT NULL ,
    CONSTRAINT pb_post_tag_post_fk FOREIGN KEY(post_no) REFERENCES pb_post(post_no) ON DELETE CASCADE ,
    CONSTRAINT pb_post_tag_tag_fk FOREIGN KEY(tag_no) REFERENCES pb_tag(tag_no) ON DELETE CASCADE
  );

------------------------------------------------------------------------------------------------------------
commit;



/* insert user ���ν��� ------------------------------------------*/
set serveroutput on
declare
      i  number  := 0; 
begin
    while  i < 84
    loop
     i  := i + 1;
      insert into pb_users values(pb_usersSeq.nextVal, concat(concat('user',i),'@test.com') , concat('user',i), 1234, sysdate );
     end loop;
end;
/
commit;

/* insert user ���� ���ν��� ------------------------------------------*/
set serveroutput on
declare
      i  number  := 0; 
begin
    while  i < 84
    loop
     i  := i + 1;
      insert into pb_users_img values(pb_users_imgSeq.nextVal,  i,  concat(concat('0',i), '.png') );
     end loop;
end;
/
commit;

/* insert user ���������� ���ν��� ------------------------------------------*/
set serveroutput on
declare
      i  number  := 0; 
begin
    while  i < 84
    loop
     i  := i + 1;
      insert into pb_users_profile values(pb_users_profileSeq.nextVal, i, concat('name', i ), concat(concat('�ȳ��ϼ���',i),'�ݰ����ϴ� �����׽�Ʈ���̿���!'));
     end loop;
end;
/
commit;

------------------------------------------------[ SQL  ���̵���Ÿ ]------------------------------------------------

-- pb_post [ post_no / post_caption / post_reg_date / user_no / post_file_count ]
--- pb_post_file [ post_file_no / post_no / post_file_name ]
insert into pb_post values(pb_postSeq.nextVal, '�̻� #���ϼ� #���ֻ��� ���ֺ���簡 �ɲ���! ' ,  sysdate, 16, 5);
insert into pb_post_file values(pb_post_fileSeq.nextVal, 1, 's_wj1.jpg');
insert into pb_post_file values(pb_post_fileSeq.nextVal, 1, 'wj2.jpg');
insert into pb_post_file values(pb_post_fileSeq.nextVal, 1, 'wj3.jpg');
insert into pb_post_file values(pb_post_fileSeq.nextVal, 1, 'wj4.jpg');
insert into pb_post_file values(pb_post_fileSeq.nextVal, 1, 'wj5.jpg');

insert into pb_post values(pb_postSeq.nextVal,'#�ݷ��������� #�ݷ��߻����� #�����ʻ��� #�ݷ��ǹ��� ����̺�Ʈ �� ' , sysdate, 72 , 4);
insert into pb_post_file values(pb_post_fileSeq.nextVal, 2, 's_cat1.jpg');
insert into pb_post_file values(pb_post_fileSeq.nextVal, 2, 'cat2.jpg');
insert into pb_post_file values(pb_post_fileSeq.nextVal, 2, 'cat3.jpg');
insert into pb_post_file values(pb_post_fileSeq.nextVal, 2, 'cat4.jpg');

insert into pb_post values(pb_postSeq.nextVal,'#�ݷ��������� #�ݷ��߻����� #�����ʻ��� #�ݷ��ǹ��� ����̺�Ʈ �� ' , sysdate, 72 , 3);
insert into pb_post_file values(pb_post_fileSeq.nextVal, 3, 's_dog1.jpg');
insert into pb_post_file values(pb_post_fileSeq.nextVal, 3, 'dog2.jpg');
insert into pb_post_file values(pb_post_fileSeq.nextVal, 3, 'dog3.jpg');

insert into pb_post values(pb_postSeq.nextVal,'#���డ��ʹ� #�����ڱػ��� ' , sysdate, 78 , 1);
insert into pb_post_file values(pb_post_fileSeq.nextVal, 4, 's_tree.jpg');

insert into pb_post values(pb_postSeq.nextVal,'#�ݷ��������� #�ݷ��߻����� #�����ʻ��� #�ݷ��ǹ��� ����̺�Ʈ �� ' , sysdate, 72 , 2);
insert into pb_post_file values(pb_post_fileSeq.nextVal, 5, 's_cat11.jpg');
insert into pb_post_file values(pb_post_fileSeq.nextVal, 5, 'cat22.jpg');

insert into pb_post values(pb_postSeq.nextVal,'#�ݷ��������� #�ݷ��߻����� #�����ʻ��� #�ݷ��ǹ��� ����̺�Ʈ �� ' , sysdate, 72 , 4);
insert into pb_post_file values(pb_post_fileSeq.nextVal, 6, 's_ydog1.jpg');
insert into pb_post_file values(pb_post_fileSeq.nextVal, 6, 'ydog2.jpg');
insert into pb_post_file values(pb_post_fileSeq.nextVal, 6, 'ydog3.jpg');
insert into pb_post_file values(pb_post_fileSeq.nextVal, 6, 'ydog4.jpg');

insert into pb_post values(pb_postSeq.nextVal,'#�ݷ��������� #�ݷ��߻����� #�����ʻ��� #�ݷ��ǹ��� ����̺�Ʈ �� ' , sysdate, 72 , 3);
insert into pb_post_file values(pb_post_fileSeq.nextVal, 7, 's_bdog1.jpg');
insert into pb_post_file values(pb_post_fileSeq.nextVal, 7, 'bcat2.jpg');
insert into pb_post_file values(pb_post_fileSeq.nextVal, 7, 'bcat3.jpg');

--pb_reply [ reply_no / user_no / post_no / reply_reg_date / content ]
--pb_reply [ reply_no / user_no / post_no / reply_reg_date / content ]
insert into pb_reply values(pb_replySeq.nextVal, 26, 1, sysdate, '�׽�Ʈ ����Դϴ�! ���� 26' );
insert into pb_reply values(pb_replySeq.nextVal, 16, 1, sysdate, '������ �� �̻ڳ׿�' );
insert into pb_reply values(pb_replySeq.nextVal, 22, 1, sysdate, '�����մϴ�~!!' );
insert into pb_reply values(pb_replySeq.nextVal, 24, 1, sysdate, '�׽�Ʈ ����Դϴ�! ���� 24' );

insert into pb_reply values(pb_replySeq.nextVal, 16, 2, sysdate, '����̴� ����Դϴ� �Ф�' );
insert into pb_reply values(pb_replySeq.nextVal, 40, 2, sysdate, '���๮�� �����~!' );
insert into pb_reply values(pb_replySeq.nextVal, 41, 2, sysdate, '������ ��� �ǳ���??' );
insert into pb_reply values(pb_replySeq.nextVal, 42, 2, sysdate, '�׽�Ʈ ����Դϴ�! ���� 42' );
insert into pb_reply values(pb_replySeq.nextVal, 43, 2, sysdate, '������ ����� ��ҳ׿�' );
insert into pb_reply values(pb_replySeq.nextVal, 44, 2, sysdate, 'photobook!!' );
insert into pb_reply values(pb_replySeq.nextVal, 45, 2, sysdate, '�����Ϸ��� ���?' );
insert into pb_reply values(pb_replySeq.nextVal, 46, 2, sysdate, '����̴� ����Դϴ� �Ф�' );
insert into pb_reply values(pb_replySeq.nextVal, 47, 2, sysdate, 'photobook!!' );
insert into pb_reply values(pb_replySeq.nextVal, 48, 2, sysdate, '�ʹ����������' );
insert into pb_reply values(pb_replySeq.nextVal, 49, 2, sysdate, '����̴� ����Դϴ� �Ф�' );
insert into pb_reply values(pb_replySeq.nextVal, 50, 2, sysdate, '���̵���Ÿ �׽�Ʈ!!!' );
insert into pb_reply values(pb_replySeq.nextVal, 51, 2, sysdate, '�׽�Ʈ ����Դϴ�! ���� 51' );
insert into pb_reply values(pb_replySeq.nextVal, 52, 2, sysdate, '�׽�Ʈ ����Դϴ�! ���� 52' );
insert into pb_reply values(pb_replySeq.nextVal, 53, 2, sysdate, '�׽�Ʈ ����Դϴ�! ���� 53' );
insert into pb_reply values(pb_replySeq.nextVal, 54, 2, sysdate, '�׽�Ʈ ����Դϴ�! ���� 54' );
insert into pb_reply values(pb_replySeq.nextVal, 55, 2, sysdate, '����̴� ����Դϴ� �Ф�' );
insert into pb_reply values(pb_replySeq.nextVal, 56, 2, sysdate, 'photobook!!' );
insert into pb_reply values(pb_replySeq.nextVal, 57, 2, sysdate, '����̴� ����Դϴ� �Ф�' );
insert into pb_reply values(pb_replySeq.nextVal, 58, 2, sysdate, '�׽�Ʈ ����Դϴ�! ���� 58' );
insert into pb_reply values(pb_replySeq.nextVal, 59, 2, sysdate, '�׽�Ʈ ����Դϴ�! ���� 59' );

insert into pb_reply values(pb_replySeq.nextVal, 16, 3, sysdate, '������ ������ ��ҳ׿�' );
insert into pb_reply values(pb_replySeq.nextVal, 40, 3, sysdate, '�ʹ� �Ϳ��׿�' );
insert into pb_reply values(pb_replySeq.nextVal, 41, 3, sysdate, '���Ͽ��� �����Ѱ���?? ' );
insert into pb_reply values(pb_replySeq.nextVal, 42, 3, sysdate, '��ǰ�ε���? ' );
insert into pb_reply values(pb_replySeq.nextVal, 43, 3, sysdate, '�߻���� ' );
insert into pb_reply values(pb_replySeq.nextVal, 44, 3, sysdate, '��Ʈ��Ʈ' );
insert into pb_reply values(pb_replySeq.nextVal, 45, 3, sysdate, '����������������~~~' );
insert into pb_reply values(pb_replySeq.nextVal, 84, 3, sysdate, '��Ʈ��Ʈ' );
insert into pb_reply values(pb_replySeq.nextVal, 83, 3, sysdate, '����������������~~~' );
insert into pb_reply values(pb_replySeq.nextVal, 82, 3, sysdate,'��Ʈ��Ʈ' );
insert into pb_reply values(pb_replySeq.nextVal, 81, 3, sysdate, '�׽�Ʈ ��۳���� 1! ' );
insert into pb_reply values(pb_replySeq.nextVal, 80, 3, sysdate, '�߻���� ' );
insert into pb_reply values(pb_replySeq.nextVal, 79, 3, sysdate, '�׽�Ʈ ��۳���� 2! ' );
insert into pb_reply values(pb_replySeq.nextVal, 78, 3, sysdate, '�׽�Ʈ ��۳���� 3! ' );
insert into pb_reply values(pb_replySeq.nextVal, 77, 3, sysdate, 'photobook!!' );
insert into pb_reply values(pb_replySeq.nextVal, 76, 3, sysdate, '���� �Ϸ絵 ������ #ȭ����!' );
insert into pb_reply values(pb_replySeq.nextVal, 75, 3, sysdate, '�׽�Ʈ ��۳���� 4! ' );
insert into pb_reply values(pb_replySeq.nextVal, 74, 3, sysdate, 'photobook!!' );
insert into pb_reply values(pb_replySeq.nextVal, 73, 3, sysdate, '�׽�Ʈ ��۳���� 5! ' );
insert into pb_reply values(pb_replySeq.nextVal, 71, 3, sysdate, '���๮�� �����~!' );
insert into pb_reply values(pb_replySeq.nextVal, 70, 3, sysdate, '����̴� ����Դϴ� �Ф�' );

insert into pb_reply values(pb_replySeq.nextVal, 70, 4, sysdate, '���� ���డ��ͳ׿�..' );
insert into pb_reply values(pb_replySeq.nextVal, 73, 4, sysdate, '�����׿� ����' );

insert into pb_reply values(pb_replySeq.nextVal, 52, 5, sysdate, '���๮�� �����~!' );
insert into pb_reply values(pb_replySeq.nextVal, 53, 5, sysdate, '���� �Ϸ絵 ������ #ȭ����!' );
insert into pb_reply values(pb_replySeq.nextVal, 54, 5, sysdate, '����� ���ΰ���?? ' );
insert into pb_reply values(pb_replySeq.nextVal, 55, 5, sysdate, '���Ͽ��� �����Ѱ���?? ' );
insert into pb_reply values(pb_replySeq.nextVal, 56, 5, sysdate, '�׽�Ʈ ����Դϴ�! ���� 56' );
insert into pb_reply values(pb_replySeq.nextVal, 57, 5, sysdate, '�׽�Ʈ ����Դϴ�! ���� 57' );
insert into pb_reply values(pb_replySeq.nextVal, 58, 5, sysdate, '������ ����� ��ҳ׿�' );
insert into pb_reply values(pb_replySeq.nextVal, 59, 5, sysdate, '����̴� ����Դϴ� �Ф�' );


insert into pb_reply values(pb_replySeq.nextVal, 52, 6, sysdate, '���๮�� �����~!' );
insert into pb_reply values(pb_replySeq.nextVal, 53, 6, sysdate, '���� �Ϸ絵 ������ #ȭ����!' );
insert into pb_reply values(pb_replySeq.nextVal, 54, 6, sysdate, '����� ���ΰ���?? ' );
insert into pb_reply values(pb_replySeq.nextVal, 55, 6, sysdate, '���Ͽ��� �����Ѱ���?? ' );
insert into pb_reply values(pb_replySeq.nextVal, 56, 6, sysdate, '�׽�Ʈ ����Դϴ�! ���� 56' );
insert into pb_reply values(pb_replySeq.nextVal, 57, 6, sysdate, '�׽�Ʈ ����Դϴ�! ���� 57' );
insert into pb_reply values(pb_replySeq.nextVal, 58, 6, sysdate, '������ ����� ��ҳ׿�' );
insert into pb_reply values(pb_replySeq.nextVal, 59, 6, sysdate, '����̴� ����Դϴ� �Ф�' );
insert into pb_reply values(pb_replySeq.nextVal, 52, 6, sysdate, '���๮�� �����~!' );

insert into pb_reply values(pb_replySeq.nextVal, 53, 7, sysdate, '���� �Ϸ絵 ������ #ȭ����!' );
insert into pb_reply values(pb_replySeq.nextVal, 54, 7, sysdate, '����� ���ΰ���?? ' );
insert into pb_reply values(pb_replySeq.nextVal, 55, 7, sysdate, '���Ͽ��� �����Ѱ���?? ' );
insert into pb_reply values(pb_replySeq.nextVal, 56, 7, sysdate, '�׽�Ʈ ����Դϴ�! ���� 56' );
insert into pb_reply values(pb_replySeq.nextVal, 57, 7, sysdate, '�׽�Ʈ ����Դϴ�! ���� 57' );
insert into pb_reply values(pb_replySeq.nextVal, 58, 7, sysdate, '������ ����� ��ҳ׿�' );
insert into pb_reply values(pb_replySeq.nextVal, 59, 7, sysdate, '����̴� ����Դϴ� �Ф�' );
insert into pb_reply values(pb_replySeq.nextVal, 45, 7, sysdate, '���๮�� �����~!' );
insert into pb_reply values(pb_replySeq.nextVal, 84, 7, sysdate, '��Ʈ��Ʈ' );
insert into pb_reply values(pb_replySeq.nextVal, 83, 7, sysdate, '����������������~~~' );
insert into pb_reply values(pb_replySeq.nextVal, 82, 7, sysdate,'��Ʈ��Ʈ' );
insert into pb_reply values(pb_replySeq.nextVal, 81, 7, sysdate, '�׽�Ʈ ��۳���� 1! ' );
insert into pb_reply values(pb_replySeq.nextVal, 80, 7, sysdate, '�߻���� ' );
insert into pb_reply values(pb_replySeq.nextVal, 79, 7, sysdate, '�׽�Ʈ ��۳���� 2! ' );
insert into pb_reply values(pb_replySeq.nextVal, 78, 7, sysdate, '���๮�� �����~!' );
insert into pb_reply values(pb_replySeq.nextVal, 77, 7, sysdate, 'photobook!!' );
insert into pb_reply values(pb_replySeq.nextVal, 76, 7, sysdate, '���Ͽ��� �����Ѱ���??' );


-- pb_like [ like_no / user_no / post_no ]
insert into pb_like values(pb_likeSeq.nextVal, 16, 2);

insert into pb_like values(pb_likeSeq.nextVal, 19, 6);
insert into pb_like values(pb_likeSeq.nextVal, 16, 6);
insert into pb_like values(pb_likeSeq.nextVal, 53, 6);
insert into pb_like values(pb_likeSeq.nextVal, 54, 6);
insert into pb_like values(pb_likeSeq.nextVal, 55, 6);
insert into pb_like values(pb_likeSeq.nextVal, 66, 6);

insert into pb_like values(pb_likeSeq.nextVal, 19, 7);
insert into pb_like values(pb_likeSeq.nextVal, 16, 7);
insert into pb_like values(pb_likeSeq.nextVal, 53, 7);
insert into pb_like values(pb_likeSeq.nextVal, 54, 7);
insert into pb_like values(pb_likeSeq.nextVal, 55, 7);
insert into pb_like values(pb_likeSeq.nextVal, 66, 7);
insert into pb_like values(pb_likeSeq.nextVal, 46, 7);
insert into pb_like values(pb_likeSeq.nextVal, 33, 7);
insert into pb_like values(pb_likeSeq.nextVal, 78, 7);
insert into pb_like values(pb_likeSeq.nextVal, 77, 7);
insert into pb_like values(pb_likeSeq.nextVal, 84, 7);

-- pb_follow  [ follow_no / active_user_no / passive_user_no ]
insert into pb_follow values(pb_followSeq.nextVal, 16, 78);
insert into pb_follow values(pb_followSeq.nextVal, 17, 78);
insert into pb_follow values(pb_followSeq.nextVal, 18, 78);
insert into pb_follow values(pb_followSeq.nextVal, 19, 78);
insert into pb_follow values(pb_followSeq.nextVal, 20, 78);
insert into pb_follow values(pb_followSeq.nextVal, 21, 78);
insert into pb_follow values(pb_followSeq.nextVal, 22, 78);
insert into pb_follow values(pb_followSeq.nextVal, 23, 78);
insert into pb_follow values(pb_followSeq.nextVal, 24, 78);
insert into pb_follow values(pb_followSeq.nextVal, 25, 78);
insert into pb_follow values(pb_followSeq.nextVal, 26, 78);

insert into pb_follow values(pb_followSeq.nextVal, 16, 72);
insert into pb_follow values(pb_followSeq.nextVal, 17, 72);
insert into pb_follow values(pb_followSeq.nextVal, 18, 72);
insert into pb_follow values(pb_followSeq.nextVal, 19, 72);
insert into pb_follow values(pb_followSeq.nextVal, 20, 72);
insert into pb_follow values(pb_followSeq.nextVal, 21, 72);
insert into pb_follow values(pb_followSeq.nextVal, 22, 72);
insert into pb_follow values(pb_followSeq.nextVal, 23, 72);
insert into pb_follow values(pb_followSeq.nextVal, 24, 72);
insert into pb_follow values(pb_followSeq.nextVal, 25, 72);
insert into pb_follow values(pb_followSeq.nextVal, 26, 72);
insert into pb_follow values(pb_followSeq.nextVal, 27, 72);
insert into pb_follow values(pb_followSeq.nextVal, 28, 72);
insert into pb_follow values(pb_followSeq.nextVal, 29, 72);
insert into pb_follow values(pb_followSeq.nextVal, 30, 72);
insert into pb_follow values(pb_followSeq.nextVal, 31, 72);
insert into pb_follow values(pb_followSeq.nextVal, 32, 72);
insert into pb_follow values(pb_followSeq.nextVal, 33, 72);
insert into pb_follow values(pb_followSeq.nextVal, 34, 72);
insert into pb_follow values(pb_followSeq.nextVal, 35, 72);
insert into pb_follow values(pb_followSeq.nextVal, 36, 72);
insert into pb_follow values(pb_followSeq.nextVal, 37, 72);
insert into pb_follow values(pb_followSeq.nextVal, 38, 72);
insert into pb_follow values(pb_followSeq.nextVal, 39, 72);
insert into pb_follow values(pb_followSeq.nextVal, 50, 72);
insert into pb_follow values(pb_followSeq.nextVal, 51, 72);
insert into pb_follow values(pb_followSeq.nextVal, 52, 72);
insert into pb_follow values(pb_followSeq.nextVal, 53, 72);
insert into pb_follow values(pb_followSeq.nextVal, 54, 72);
insert into pb_follow values(pb_followSeq.nextVal, 55, 72);
insert into pb_follow values(pb_followSeq.nextVal, 56, 72);
insert into pb_follow values(pb_followSeq.nextVal, 57, 72);
insert into pb_follow values(pb_followSeq.nextVal, 58, 72);
insert into pb_follow values(pb_followSeq.nextVal, 59, 72);
insert into pb_follow values(pb_followSeq.nextVal, 60, 72);
insert into pb_follow values(pb_followSeq.nextVal, 61, 72);

insert into pb_follow values(pb_followSeq.nextVal, 72, 16);
insert into pb_follow values(pb_followSeq.nextVal, 72, 56);
insert into pb_follow values(pb_followSeq.nextVal, 72, 57);
insert into pb_follow values(pb_followSeq.nextVal, 72, 58);
insert into pb_follow values(pb_followSeq.nextVal, 72, 59);
insert into pb_follow values(pb_followSeq.nextVal, 72, 60);
insert into pb_follow values(pb_followSeq.nextVal, 72, 61);

commit;