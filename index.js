const {Client}=require("pg");

const config ={
    user: 'postgres',
    password:'260491',
    host:'localhost',
    port:5432,
    database: 'fmTest'
};
const users = [{
    first_name:'Bred',
    last_name:'Pet',
    email:'Bred1@gmail.com',
    is_male: true,
    birthday:'1963-06-23',
    height: 1.88
},
{
    first_name:'Bred',
    last_name:'Pet',
    email:'Bred2@gmail.com',
    is_male: true,
    birthday:'1963-06-23',
    height: 1.88
},
{
    first_name:'Bred',
    last_name:'Pet',
    email:'Bred3@gmail.com',
    is_male: true,
    birthday:'1963-06-23',
    height: 1.88
}
]
const client = new Client(config);
start();

async function start(){
    await client.connect();
    const result = await client.query(`
    INSERT INTO "users"("first_name","last_name","email","is_male","birthday","height")
 VALUES  ${mapUsers(users)};
 `)
    console.log(result);
    await client.end();

}

 function mapUsers(users){
     return users.map((user)=>
     `('${user.first_name}','${user.last_name}','${user.email}','${user.is_male}','${user.birthday}','${user.height}')
     `)
     .join(",");
 }