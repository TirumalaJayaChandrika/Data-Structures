#include<stdio.h>
#include<stdlib.h>
struct node{
        int data;
        struct node *left,*right;
};
struct node* new_node( int val){
    struct node *newnode;
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
void postorder(struct node* root){
    if(root!=NULL){
      postorder(root->left);
        
        postorder(root->right);
        printf("%d ",root->data);
    }
    return;
}
void preorder(struct node* root){
    if(root!=NULL){
        printf("%d ",root->data);
      preorder(root->left);
        preorder(root->right);
    }
    return;
}
struct node* minValueNode(struct node *root){
    struct node *temp1=root;
    while(temp1 && temp1->left!=NULL){
        temp1=temp1->left;
    }
    return temp1;
}
struct node* delete_node(struct node* root,int val){
    struct node *temp;
    if(root==NULL){
        return root;
        
    }
    if(val<root->data){
        root->left=delete_node(root->left,val);
    }else if(val>root->data){
        root->right=delete_node(root->right,val);
    }else{
        if(root->left==NULL && root->right==NULL){
            free(root);
            return NULL;
        }else if(root->left==NULL || root->right==NULL){
        if(root->left==NULL){
            root=root->right;
        }else {
            root=root->right;
        }
        return root;
        }else{
            temp=minValueNode(root->right);
            root->data=temp->data;
            root->right=delete_node(root->right,temp->data);
            
        }
        }
        
    
    return root;
}
void search(struct node *root,int x){
    if(root!=NULL){
        if(x>root->data){
            search(root->right,x);
        }else if(x<root->data){
            search(root->left,x);
        }else if(root->data==x){
            printf("element found");
            return;
        }
        
    }else
    printf("element not found");
}
void main(){
    struct node *root=NULL;
       for(int i=0;i<7;i++){
                printf("enter value: ");
                int a;
                scanf("%d",&a);
                root=insert(root,a);
        }
      
        inorder(root);
        printf("postorder:");
        postorder(root);
        printf("preorder");
        preorder(root);
        root=delete_node(root,45);
        printf("\n after deletion");
         inorder(root);
         search(root,3);
}
#include<stdio.h>
#include<stdlib.h>
struct node{
        int data;
        struct node *left,*right;
};
struct node* new_node( int val){
    struct node *newnode;
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
void postorder(struct node* root){
    if(root!=NULL){
      postorder(root->left);
        
        postorder(root->right);
        printf("%d ",root->data);
    }
    return;
}
void preorder(struct node* root){
    if(root!=NULL){
        printf("%d ",root->data);
      preorder(root->left);
        preorder(root->right);
    }
    return;
}
struct node* minValueNode(struct node *root){
    struct node *temp1=root;
    while(temp1 && temp1->left!=NULL){
        temp1=temp1->left;
    }
    return temp1;
}
struct node* delete_node(struct node* root,int val){
    struct node *temp;
    if(root==NULL){
        return root;
        
    }
    if(val<root->data){
        root->left=delete_node(root->left,val);
    }else if(val>root->data){
        root->right=delete_node(root->right,val);
    }else{
        if(root->left==NULL && root->right==NULL){
            free(root);
            return NULL;
        }else if(root->left==NULL || root->right==NULL){
        if(root->left==NULL){
            root=root->right;
        }else {
            root=root->right;
        }
        return root;
        }else{
            temp=minValueNode(root->right);
            root->data=temp->data;
            root->right=delete_node(root->right,temp->data);
            
        }
        }
        
    
    return root;
}
void search(struct node *root,int x){
    if(root!=NULL){
        if(x>root->data){
            search(root->right,x);
        }else if(x<root->data){
            search(root->left,x);
        }else if(root->data==x){
            printf("element found");
            return;
        }
        
    }else
    printf("element not found");
}
void main(){
    struct node *root=NULL;
       for(int i=0;i<7;i++){
                printf("enter value: ");
                int a;
                scanf("%d",&a);
                root=insert(root,a);
        }
      
        inorder(root);
        printf("postorder:");
        postorder(root);
        printf("preorder");
        preorder(root);
        root=delete_node(root,45);
        printf("\n after deletion");
         inorder(root);
         search(root,3);
}
