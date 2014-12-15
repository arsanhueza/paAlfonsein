


#import "DemoViewController.h"
#import "MFSideMenu.h"

@interface DemoViewController()<UIWebViewDelegate>
@property(nonatomic,strong) IBOutlet UIActivityIndicatorView *indigo;


@end

@implementation DemoViewController
{
UIWebView *webeo;
UILabel *label;
NSURL *url;
NSData *pdfData;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [_indigo setHidesWhenStopped:YES];    
}


-(void)viewWillAppear:(BOOL)animated{
    
    
    [self jaja];
    
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    
    [_indigo startAnimating];
}
- (void) webViewDidFinishLoad:(UIWebView*)webView
{   [label setHidden:YES];
    [_indigo stopAnimating];
}

-(void)jaja{
    pdfData = [[NSData alloc] initWithContentsOfURL:url];
    CGRect rect = [[UIScreen mainScreen] bounds];
    webeo= [[UIWebView alloc] initWithFrame:CGRectMake(0,0,rect.size.width,rect.size.height-70)];
    webeo.autoresizesSubviews = YES;
    webeo.autoresizingMask=(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
    
    url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"home" ofType:@"pdf" inDirectory:nil]];

    self.title = NSLocalizedString(@"Bienvenido",@"");

    
    if ([_identi isEqualToString:@"home"]) {
        
        url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"home" ofType:@"pdf" inDirectory:nil]];
        self.title = NSLocalizedString(@"Bienvenido",@"");

    }
    else if ([_identi isEqualToString:@"atractivos"]) {

    url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"atractivos" ofType:@"pdf" inDirectory:nil]];
        self.title = NSLocalizedString(@"Atractivos",@"");

    }
    
    else if ([_identi isEqualToString:@"mapas"]) {
    
        self.title = NSLocalizedString(@"Mapas",@"");

        url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"mapas" ofType:@"pdf" inDirectory:nil]];

    }
    
    else if ([_identi isEqualToString:@"que"]) {
        
        self.title = NSLocalizedString(@"Que Hacer",@"");
        
        url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"que" ofType:@"pdf" inDirectory:nil]];
        
    }

    
    NSURLRequest *llama = [NSURLRequest requestWithURL:url];
    
    [webeo loadRequest:llama];
    
    webeo.scalesPageToFit = YES;
    webeo.scrollView.minimumZoomScale = 1.0;
    webeo.scrollView.maximumZoomScale = 5.0;
    
    [_indigo setHidesWhenStopped:YES];
    [webeo setUserInteractionEnabled:YES];
    [webeo setDelegate:self];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake((rect.size.width/2)-45,(rect.size.height/2)-59, rect.size.width, 100)];
    label.font = [UIFont fontWithName:@"HelveticaNeue" size:15.0];
    NSLocalizedString(@"Cargando",@"");
    label.numberOfLines=3;
    label.minimumScaleFactor = 10.0;
    label.adjustsFontSizeToFitWidth=YES;
    [self.view addSubview:webeo];
    [webeo addSubview:label];
    [webeo addSubview:_indigo];
    
    
}


-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    
    label.frame = CGRectMake(30, (rect.size.height/2)-59, rect.size.width, 100);
    label.text= @"Para acceder a esta función debe estar conectado a alguna red de internet.";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)showLeftMenuPressed:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}

@end
