Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.84])
 by mx.groups.io with SMTP id smtpd.web09.8158.1616167993811965382
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 Mar 2021 08:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=EHqOC0PJ;
 spf=pass (domain: arm.com, ip: 40.107.15.84, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSWeVHEdwIy18003NA4XBMJhSM9fftqZVyWtO1GhMOA=;
 b=EHqOC0PJ+ez4BP0md+VmE3jh4cd7OhofVRSn4zsKn/gx+nnj6GKjEKcJs0Q0TsXpwlTQnxfvjgMGLZ2Y+exaT3Oz3/bRUZ/kGPBYpdAxk0vwHmHU/bJF6ZRqx0OCE0z6RYhrVS9COvo3KTrJOajwH0RKINnrYfpbAGy8DI2Lew0=
Received: from DB6PR07CA0021.eurprd07.prod.outlook.com (2603:10a6:6:2d::31) by
 DB7PR08MB3164.eurprd08.prod.outlook.com (2603:10a6:5:24::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32; Fri, 19 Mar 2021 15:33:10 +0000
Received: from DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::2d) by DB6PR07CA0021.outlook.office365.com
 (2603:10a6:6:2d::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.9 via Frontend
 Transport; Fri, 19 Mar 2021 15:33:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT008.mail.protection.outlook.com (10.152.20.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 15:33:10 +0000
Received: ("Tessian outbound 10f3eddefbbf:v87"); Fri, 19 Mar 2021 15:33:09 +0000
X-CR-MTA-TID: 64aa7808
Received: from f4242e6cfbdc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B68A79ED-D548-4010-B0FB-E4E6DEC42304.1;
	Fri, 19 Mar 2021 15:32:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f4242e6cfbdc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 19 Mar 2021 15:32:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rks/f2lWFBkc5sI+EJMrAvLNpE+QwViHKdLVhwE3ChnK/N2ka7d2SbTabZBqLRivC/yFRQ6fWPemaGyLAqPn6I+AsZSxI7wFLz+qWxtOBjHDcWRwqnJxnbTSgPMIMI6LDRzyHMGzlC9/JHsX7/gD9dR0w69ncMmETYo0fiuUNSI8urxrUx/jjUmiluptmtKXeIEZQCIOqtDWOrvISEime1E4F0YlTWbTqKw8U8YOYkiWUGLCDF2dDLruWi0T5e6IQbIxyo6IOqjt64D6pHfxWkti2H3ex+fnkDiNCxkO4yiOiDnl0UyFnCsGyyk6QTVnGv411XQngcrrUPojovm60w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSWeVHEdwIy18003NA4XBMJhSM9fftqZVyWtO1GhMOA=;
 b=TKRhT4fxZul3YemojP0sCCYV6mhZYC1Pc4qZZHjam91Mal3kOB9YanRC7oiSjx5OSlTMMPYLQSx8yOAuP5km3s5Kf16ZYJAmHhbkkZtWVC9xWwJkHkdqqMNLgoM6BF+aeiAHVZvoDPMdpzGUEdxQS/2WXkyDR4SFQ1Op2cyMhPsPZd9cGIm4MJdKj6BhnPwj/TFsMMEIfUOLYX7VkVP7ydSoMnfDCWGApju7cuvXsUv8nWXRv28Q3dTuu+kBiJTRx2sB9yQhaysQpIB/U4LIAPD8KtUGVbI+LxNSVI3DJeTTndz6iV22GMloS/PVCshjca3aA4+DtpvsTxBmx06VTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSWeVHEdwIy18003NA4XBMJhSM9fftqZVyWtO1GhMOA=;
 b=EHqOC0PJ+ez4BP0md+VmE3jh4cd7OhofVRSn4zsKn/gx+nnj6GKjEKcJs0Q0TsXpwlTQnxfvjgMGLZ2Y+exaT3Oz3/bRUZ/kGPBYpdAxk0vwHmHU/bJF6ZRqx0OCE0z6RYhrVS9COvo3KTrJOajwH0RKINnrYfpbAGy8DI2Lew0=
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DB9PR08MB6379.eurprd08.prod.outlook.com (2603:10a6:10:261::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 15:32:56 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::2c49:a2e5:b8e6:1590]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::2c49:a2e5:b8e6:1590%7]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 15:32:56 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>, Ross Burton <Ross.Burton@arm.com>
Subject: meta-arm hardknott release plans
Thread-Topic: meta-arm hardknott release plans
Thread-Index: Adcc1ESM04thaeCGQR2soDOq4vBB7w==
Date: Fri, 19 Mar 2021 15:32:56 +0000
Message-ID: 
 <DBAPR08MB57980E82F5E504329241549BF0689@DBAPR08MB5798.eurprd08.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: CF3849F6ADB7884A8313B5F808AEDFFB.0
x-checkrecipientchecked: true
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [136.56.1.171]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ec592145-3539-4a59-57e3-08d8eaec4d8f
x-ms-traffictypediagnostic: DB9PR08MB6379:|DB7PR08MB3164:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB3164CBB514997A52CE504512F0689@DB7PR08MB3164.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 1UmM/Yo+wqN4qkSorlvtmnA+3E5GXhovvukpGKwOSYIQdpsTCHGrLJF5NeYtUQBvQs2lc4+bWGSqf96Z/hQW/wa9s3oubs47+BgqnHhXewZCXPX9aiQReDm8u8dMBEgKn+G+2D9NVXsH6NbLiDhg/iWxqk8dEwOh2ojFLyHU5479sFd/W+tXd9WKp8X32r46G47MC5QKWwqP4dSDo9JdohvF9vDkPGmGGYRHcljZRmyRbI/ztlDjKGKyarmvcryicEbQq308JokghFnXFn6pdEKr+XqaU+PrVqtNdyhs87SFeDkHcenFrppMHBLHz/OmHoDPN2Xg32A/YkuFXR0mLMqxW5EkGE37yaYnFUv6XliMZmOGhXsPbdw61jy7V4KFDV/nAsXZs7SATOYRZ6IgFMP+NFmycLlyvW917SlTsctDr2PpK1KG+33Ah8dOoaVldhCh0v8mCIXWKINfn+oa6heIjYUB2LZ5gqxmhTNoVybHUHsYhIBd2ZXStPJVRADOlMuF7/78H1YIZw0sBjno3esLsoOuuJCV/A8hOqmHKkxWPDvz0k2LzOkfjKOrkFm+lFI5fwpOItMF7tCRBJIxXQ+wOS16wtp6ltT54a1w0UHv1TuGVugJ6LDCP8q4RQjKiLDYEo6XDnp4Ye+OHkvUr05Qq+NDwlRXoijSu58a6ZQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(316002)(26005)(2906002)(38100700001)(8676002)(6506007)(71200400001)(83380400001)(186003)(54906003)(7696005)(33656002)(5660300002)(3480700007)(4744005)(64756008)(86362001)(52536014)(6916009)(8936002)(478600001)(55016002)(66446008)(4326008)(66556008)(66946007)(76116006)(66476007)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?6QrnKXGpRHNLyGYwQYl6KGLAOWwI9smmx/Ti9pd37rzJJQJDz2Yl1vHCNbwY?=
 =?us-ascii?Q?OexNDK8Etz2KWDjyI4BRCuHeLnlWyut1izMig0IrAkaOTMGPc/XUqZOrM0fi?=
 =?us-ascii?Q?YSJ1zE1tTsBY71kyQyLEvYrMIDDeANdQ5a+keRazbXmR2ZMAZ88j9qJmVyEf?=
 =?us-ascii?Q?DfQR5X+fvZnBpx8nI9epFfzjyJKvq24tAvOnloLWNgTcm1Rl4tZ44m+Cve0O?=
 =?us-ascii?Q?bAOz5d6KKw1UhDBfsB/doqsF0ZpuRV0esk4BHIrlbFnIIjeuAWj7MDTTqL5F?=
 =?us-ascii?Q?GjQ7TOBFleRQNY216uCn4EroVnIOx6Od+4KnVLhgvn78UCWtTfnXDXJFe0at?=
 =?us-ascii?Q?rOq2QnPzqJ345m/nY2umq4Le9nwbM7yVfg++mzDEN7rigYpxVMmPKxz/znN5?=
 =?us-ascii?Q?Jse25SmFplWW3jl4B9jcxnqveg/7vo57lu28NM/h13rPRdtLIdEPhIpx9n40?=
 =?us-ascii?Q?Cuby0MPUyUVmD4IR03kf3X44w36BLtu2WLPt2ju2vB51nDPVcaqmbQlmOrBj?=
 =?us-ascii?Q?OOPScFrtHS3dqXg8IdLCNkr4zhj66f7tLhO6/qo99cH6EMDbFh2db1CSftzD?=
 =?us-ascii?Q?tpZCJmmC2b6yfIhUlIuTUJv48yDs7E26I4etDbJyhBaVszU3vKmpJg1PLbLM?=
 =?us-ascii?Q?O4+SgElDnftxoFZsSTDOO3yb05feKWp+jRNMOiValSychT7eCF7s+At8teBR?=
 =?us-ascii?Q?ggT9QC0H631wLxbT/QBcw7SngNcwd/xv6/IEcXVprjaytCYEWDUNQ2gNAX+z?=
 =?us-ascii?Q?9/y5pjLsuKXH/d37/THy62eHuwXyGFCdS/VyPy2OhqH/LDUZ+91DIA9UlRHP?=
 =?us-ascii?Q?m2IF49S0TNQWRpNSkdnHYg5uTRicQSuAKk8IhQZR9KtpXcgry0qf3kNAcN1A?=
 =?us-ascii?Q?ENqn/g7edXpWzVy4yG/1AxmRWD+48Qrg4VVNzCFxWw4q3VPoqxabmDvmWfVp?=
 =?us-ascii?Q?zouscScHY4ofQpJf6wg4ay48pH3iQX7mA43tH0QvOE5L9m/43KKsPesHojbZ?=
 =?us-ascii?Q?p29KW6eM6ulWBzfCu4tzGDWWKstCL5L898uGAYfqv/uQ7VQWcX54TAyZPuKs?=
 =?us-ascii?Q?c5vmYbXmIxGsVYaYB+EPwsqs5+COL7K7Dn9CPYIqZB4DuUDYQYz4ZO6+OGT+?=
 =?us-ascii?Q?pZ9cCeTeQVApueBYKCq63HLNMP+1Yar6Nec48BBMjlaMccT2DmZt9bWFlOFd?=
 =?us-ascii?Q?rJJPPZnFujM2aqx5hA/uVTJsEVKdfyO0GJlrFwOiy5asIwoNNGo9WxnV6XXw?=
 =?us-ascii?Q?EI3YvrB+Kvp6Oo0A1mIyWxn5HpZSXnC/wHCbbb0GsQ10xJBqqal7vJl1jutb?=
 =?us-ascii?Q?Y88=3D?=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6379
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9e37fb64-2cf0-4daf-97e9-08d8eaec4536
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VMwN5aKZ63TeYZEOQrPAI5UkLMmUUw0k8hhglbPowpjwfSwg/5FuqwpZMwKJg348MAZrbwbkkvtXbpQX6y/QBf5GdyV9JF1m2vpSO4cLRYEywyk9QrLaXqvBsJygdqXukk62CNKMoZdYKD8qdskZGFUvn3Y7pXk7BSl/uudi5oAy2WwrGpgUPAlqvbEMFKU0P0ub5uicIQrmORuBCRLVBTFW3zp9RLSVLUHNJi4vOMxTcZpiAUk8WvBKWYqcfdnKI+aWn8pUqmin/BGzMVw0L7UGETJLRu9BabxOYg9AjNXPm60rFo4/IK35MCZBJ+1Uvy5/gGv6JdOpphhbUaV0SnghNOze8f/F4CEuTCNrDcKxBy6zNKYqeJGrf1U2Pt6fTFinEh0kLR87wNWmTUwJVzz4a7GwHZV3S7NBLfx8lJ+jugLVcNxZM0Zq+s/V1dtEfegfvm5XsQz1Cp4uEHAS/bbgoJqXeuAEioesRnTZq1e8tdLkLYw+tYldEP2nEh7Xl6cuyxkgioBGbmVCVam6SJYmO8Sseo7ZDQsr/c67rRWJ7Hac7VHmbzS3MBhnSNfxiSX+t4w6tWEviS03GZC9pJqQFgo5IjUDSaTdpoT3mmDnU4EUrP+bEiPPm2e5zrQJ1CnvIpjHiGywv6OuttO23P485iaNCBqbztHJa++nYPQ=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(36840700001)(46966006)(33656002)(5660300002)(7696005)(47076005)(356005)(316002)(478600001)(6506007)(82310400003)(4326008)(3480700007)(81166007)(54906003)(52536014)(336012)(55016002)(6916009)(186003)(83380400001)(26005)(9686003)(2906002)(8676002)(70206006)(36860700001)(70586007)(8936002)(82740400003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 15:33:10.4157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec592145-3539-4a59-57e3-08d8eaec4d8f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3164
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DBAPR08MB57980E82F5E504329241549BF0689DBAPR08MB5798eurp_"

--_000_DBAPR08MB57980E82F5E504329241549BF0689DBAPR08MB5798eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yocto Project will be making the Hardknott release in April, and meta-arm w=
ill be making a release to coincide with it.  To facilitate this release, w=
e are requesting that:

* All outstanding features be pushed within the next 2 weeks (deadline 02 A=
pril 2021)

* All bugs be addressed in the 4 weeks following the feature freeze (deadli=
ne 30 April 2021)



Barring an issue or something on the mailing list that is in the process of=
 being integrated, we will cut the meta-arm hardknott release on 30 April 2=
021



If there are questions or comments, please feel free to respond to this thr=
ead on the mailing list or email me and/or Ross directly.



Thanks,

Jon


--_000_DBAPR08MB57980E82F5E504329241549BF0689DBAPR08MB5798eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText">Yocto Project will be making the Hardknott releas=
e in April, and meta-arm will be making a release to coincide with it.&nbsp=
; To facilitate this release, we are requesting that:<o:p></o:p></p>
<p class=3D"MsoPlainText">* All outstanding features be pushed within the n=
ext 2 weeks (deadline 02 April 2021)<o:p></o:p></p>
<p class=3D"MsoPlainText">* All bugs be addressed in the 4 weeks following =
the feature freeze (deadline 30 April 2021)<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Barring an issue or something on the mailing list=
 that is in the process of being integrated, we will cut the meta-arm hardk=
nott release on 30 April 2021<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">If there are questions or comments, please feel f=
ree to respond to this thread on the mailing list or email me and/or Ross d=
irectly.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Thanks,<o:p></o:p></p>
<p class=3D"MsoPlainText">Jon<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DBAPR08MB57980E82F5E504329241549BF0689DBAPR08MB5798eurp_--
