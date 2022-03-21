#include<stdio.h>
#include<stdlib.h>

struct node{
    int data;
    struct node *left,*right;
};
int r=-1,f=-1;
struct node *a[20];
struct node* new_node( int data){
    struct node *newnode=(struct node*)malloc(sizeof(struct node));
    newnode->data=data;
    newnode->left=NULL;
    newnode->right=NULL;
    return newnode;
}
struct node* insert(struct node *root,int data){
    
    if(root==NULL){
       root= new_node(data);
    }else if(root->data>data){
        root->left=insert(root->left,data);
        
    }else{
        root->right=insert(root->right,data);
    }
    return root;
}
int height(struct node *root){
    if(root==NULL){
        return -1;
    }
    int lc,rc,h;
    lc=height(root->left);
    rc=height(root->right);
    if(lc>rc){
        h=lc+1;
    }else{
        h=rc+1;
    }
    return h;
}
void search(struct node *temp, int val){
    if(temp!=NULL){
        if(temp->data>val)
        search(temp->left,val);
        else if(temp->data<val)
        search(temp->right,val);
        else if(temp->data==val){
            printf("element found\n");
            return;
        }
       
    }
    else if(temp==NULL){
    printf("element not found\n");
    return;
    }
}
struct node* minValueNode(struct node *root){
    struct node *temp=root;
    while(temp->left!=NULL){
        temp=temp->left;
    }
    return temp;
}
struct node* deletion(struct node *root,int val){
    struct node *temp;
    if(root==NULL){
        return root;
    }else if(root->data>val){
        root->left=deletion(root->left,val);
    }else if(root->data<val){
        root->right=deletion(root->right,val);
    }else{
        if(root->right==NULL && root->left==NULL){
            free(root);
            return NULL;
        }else if(root->right==NULL || root->left==NULL){
            if(root->right==NULL){
                temp=root->left;
            }
            else{
                temp=root->right;
            }
                free(root);
                return temp;
        }else{
            temp=minValueNode(root->right);
            root->data=temp->data;
            root->right=deletion(root->right,temp->data);
        }
        
        
    }
    return root;
}
void inorder(struct node *root){
    struct node *temp=root;
    if(temp!=NULL){
        inorder(temp->left);
        printf("%d ",temp->data);
        inorder(temp->right);
    }
}
void enqueue(struct node *root){
    if(f==-1 && r==-1){
        r=0;
    }else{
        r++;
    }
    a[r]=root;
}
struct node* dequeue(){
    if(f==r){
        printf("queue is empty");
    }
    f++;
    return a[f];
}
int isEmpty(){
    if(f==-1 && r==-1 || f==r)
    return 1;
    return 0;
}
void levelOrder(struct node *root){
    enqueue(root);
    while(isEmpty()==0){
        struct node *z=dequeue();
        printf("%d ",z->data);
        if(z->left!=NULL)
        enqueue(z->left);
        if(z->right!=NULL)
        enqueue(z->right);
    }
}
void main(){
    int n;
    printf("enter elements no");
    scanf("%d",&n);
    struct node *root=NULL;
    for(int i=0;i<n;i++){
        int data;
    printf("enter element");
    scanf("%d",&data);
        root=insert(root,data);
    }
    inorder(root);
   printf("\nheight=%d",height(root));
    int val;
    printf("enter element");
    scanf("%d",&val);
   search(root,val);
   printf("enter element to delete:");
   scanf("%d",&val);
    deletion(root,val);
   printf("\nafter deletion: ");
   inorder(root);
   printf("\n levelorder: ");
   levelOrder(root);
}


