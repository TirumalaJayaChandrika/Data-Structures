#include<stdio.h>
#include<stdlib.h>
struct node{
        int data;
        struct node *left,*right;
}*newnode,*root=NULL;
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

void main(){
        for(int i=0;i<4;i++){
                printf("enter value: ");
                int a;
                scanf("%d",&a);
                root=insert(root,a);
        }
      
        inorder(root);
}
