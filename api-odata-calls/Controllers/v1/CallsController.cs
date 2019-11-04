using api_odata_calls.Models;
using Microsoft.AspNet.OData;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace api_odata_calls.Controllers.v1
{
    [ApiController]
    [Produces("application/json")]
    [Route("api/v1/[controller]")]
    public class CallsController : ControllerBase
    {
        private readonly CallAnalyzerContext _context;

        public CallsController(CallAnalyzerContext context)
        {
            _context = context;
        }

        [HttpGet]
        [EnableQuery]
        public IEnumerable<Calls> Get()
        {
            return _context.Calls;
        }
    }
}
