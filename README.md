# Linked-List
C Language
#include<stdio.h>
#include<stdlib.h>
struct node{
        int data;
        struct node* next;
}*new,*temp2;
struct node *head=NULL;
struct node *tail=NULL;
struct node *temp;
int c=0;
void create(){
        int n,i;
        printf("enter the range\n");
        scanf("%d",&n);
        for(i=0;i<n;i++){
                int value;
                new=(struct node*)malloc(sizeof(struct node));
                printf("enter the value %d\n",i+1);
                scanf("%d",&value);
                new->data=value;
                new->next=NULL;
                if(head==NULL){
                        head=new;
                        tail=new;
                }
                else{
                        tail->next=new;
                        tail=new;
                }
        }
}
void display(){
        temp=head;
 while(temp!=NULL){
                printf("%d ",temp->data);
                temp=temp->next;
        }
        printf("\n");
}
void insert_beg(){
        int value;
        printf("enter value\n");
        scanf("%d",&value);
        new=(struct node*)malloc(sizeof(struct node));
        new->data=value;
        new->next=head;
        head=new;
}
void insert_end(){
        int value;
        printf("enter value\n");
        scanf("%d",&value);
        new=(struct node*)malloc(sizeof(struct node));
        temp=head;
        while(temp!=tail){
                temp=temp->next;
        }
        new->data=value;
        temp->next=new;
        tail=new;
}
void insert_pos(){
        int pos,value,i;
        printf("enter position\n");
        scanf("%d",&pos);
        printf("enter value\n");
        scanf("%d",&value);
        new=(struct node*)malloc(sizeof(struct node));
        temp=head;
        for(i=1;i<pos-1;i++){
                temp=temp->next;
        }
        new->data=value;
                new->next=temp->next;
        temp->next=new;
}
void delete_beg(){
    temp=head;
    head=temp->next;
}
void delete_end(){
    temp=head;
    while(temp->next!=tail){
        temp=temp->next;
    }
    temp->next=NULL;
}
void delete_pos(){
    int pos,i;
    printf("enter the position\n");
    scanf("%d",&pos);
    temp=head;
    for(i=1;i<pos-1;i++){
        temp=temp->next;
    }
    temp->next=temp->next->next;
}
void reverse(){
    temp=NULL;
    while(head!=NULL){
    temp2=head->next;
    head->next=temp;
    temp=head;
    head=temp2;
    }
    head=temp;
}
void count(){
    temp=head;
    while(temp->next!=NULL){
        temp=temp->next;
        c++;
    }
    printf("count of given list %d\n",c);
}
void main(){
        int a;
        printf("menu\n1:insert at begining\n2:insert at end\n3:inser at pisition\n4:delete at begining\n5:delete at end\n6:delete at position\n7:reversing\n8:count \n");
        printf("enter number\n");
        scanf("%d",&a);
        create();
        printf("your list is\n");
        display();
        switch(a){
                case 1:insert_beg();
                       printf("list inserted at begining\n");
                       break;
                case 2:insert_end();
                       printf("list inserted at end\n");
                       break;
                case 3:insert_pos();
                       printf("list inserted at position is\n");
                       break;
                case 4:delete_beg();
                       printf("list deleted at begining\n");
                       break;
                case 5:delete_end();
                       printf("list deleted at end\n");
                       break;
                case 6:delete_pos();
                       printf("list deleted at position\n");
                       break;
                case 7:reverse();
                       printf("reversed list is\n");
                       break;
                case 8:count();
                       break;
               
        }
        display();
}
