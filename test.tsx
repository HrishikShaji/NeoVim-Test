interface TestProps {
id:string;
name:string;
dob:number;
}


export const Test:React.FC<TestProps> = async({id,name,dob})=>{
	return (
			<div>
			<h1>Test Heading</h1>
			<h1></h1>
			</div>
			}
