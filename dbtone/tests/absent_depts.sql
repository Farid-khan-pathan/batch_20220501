select * 
from {{ ref('dept') }} 
where dno in ({{var('dno')}})
/* where dno in ({{var('dno')}}) */