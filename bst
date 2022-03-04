#include<stdio.h>
#include<stdlib.h>
struct node{
        int data;
        struct node *left,*right;
}*newnode,*root=NULL,*temp,*temp1;
struct node* new_node( int val){
        newnode=(struct node*)malloc(sizeof(struct node*));
        newnode->data=val;
        newnode->left=newnode->right=NULL;
        return newnode;
}
struct node* insert(struct node *root, int val){
        if(root==NULL)
                return new_node(val);
        else if(val > root->data){
             root->right=insert(root->right,val);   
             
        }
        else
         root->left=insert(root->left,val);
            
        return root;
}
void inorder(struct node* root){
    if(root!=NULL){
      inorder(root->left);
        printf("%d ",root->data);
        inorder(root->right);
    }
    return;
}
struct node* minValueNode(root){
    temp1=root;
    while(temp1 && temp1->left!=NULL){
        temp1=temp1->left;
    }
    return temp1;
}
struct node* delete_node(struct node* root,int val){
    if(root==NULL){
        return root;
        
    }
    if(val<root->data){
        root->left=delete_node(root->left,val);
    }else if(val>root->data){
        root->right=delete_node(root->right,val);
    }else{
        if(root->left==NULL){
            temp=root->right;
            free(root);
            return temp;
        }else if(root->right==NULL){
            temp=root->right;
            free(root);
            return temp;
        }else{
            temp=minValueNode(root->right);
            root->data=temp->data;
            root->right=delete_node(root->right,temp->data);
            
        }
        
    }
    return temp;
}
void main(){
        for(int i=0;i<8;i++){
                printf("enter value: ");
                int a;
                scanf("%d",&a);
                root=insert(root,a);
        }
      
        inorder(root);
        root=delete_node(root,);
         inorder(root);
}
