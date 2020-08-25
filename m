Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.60])
 by mx.groups.io with SMTP id smtpd.web10.14269.1598363965721454032
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 25 Aug 2020 06:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Z0qkCT29;
 spf=pass (domain: arm.com, ip: 40.107.2.60, mailfrom: steve.capper@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0lj5Vbtc/0agj8ydXCoOMX0vN7usStloTzxJ/q2iJQ=;
 b=Z0qkCT296lTQBKnXhJbS4Ze/f/w8GgJRn32REP/8EM2DcKayIthmy2A2yw0DEskcNa3HQqg0T9nxdzvSVLCNDh1da5/tl3PgknUPiumzPZbMtPAlqn+HGX/EAI93VczTutVr3EqAK3FRFL0Q7vo3lC2Oy4ijAoXOwhPYOgr7UlI=
Received: from AM6PR10CA0019.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::32)
 by DB6PR0801MB1832.eurprd08.prod.outlook.com (2603:10a6:4:3c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 13:59:21 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::9a) by AM6PR10CA0019.outlook.office365.com
 (2603:10a6:209:89::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Tue, 25 Aug 2020 13:59:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 13:59:21 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Tue, 25 Aug 2020 13:59:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3f69f78a7973c8b9
X-CR-MTA-TID: 64aa7808
Received: from 8dc903fb67e5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 77772EA1-8840-4ECE-9EA2-813F63E1CE88.1;
	Tue, 25 Aug 2020 13:59:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8dc903fb67e5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 25 Aug 2020 13:59:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaIg/BwqSOh0KJKNac3Z3/su7W/GkOPhL9jsZC55oWWCoFSq0jLKqp9advdX71lG+1oYAek2/DevbVzAXAF2Zd7CZwc3MgKnaop/MFPJovzsi4DK37iig8HcbZIJr2Pd3gOhkhDUt2l+UBnsab8sSDI2cFq5bA7ughQNBYbviNDkOhFSRAsdzWJmsNfZFfauwep8s8OXzaiU9UVnpq57GxMVShp9AdTtsTc66HUTdiPDtWLW70mgMx5ZlYIbI9Judt2Iq3OGnYERSv6/sQv2nOX+L4o8pChCEby9kVK6ghl2kUIPikXZKjkaKK3rm/+uzk8peEdffUa2VlNqzLcRIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0lj5Vbtc/0agj8ydXCoOMX0vN7usStloTzxJ/q2iJQ=;
 b=F4BL5ko2MlaqSz7+X6qHIwiE72eJVxZXvrmiwWXty5SvO1CKEy6d4U8s3Du9y1VYi0TmOi89kMOAuEEWZDHIRrfXzVboFdPURfLG1/UjAVUt1helsJ+GWqfdLFfbbaqR3akR37If6sw8aP5WNlg49pQtATQrZvKUhPaJqnBkysI2okxeskzy4OWw9O9EEfGEOb03nw++WSNDKaTfK/Lq+zqIfjEzQj1vdBgD/OqhRkolEhBMBL2Hpi5Vxug+PO5tpaUFRAED1XhfXcyhSwiNb6zRCB8ms/N5CNxWJLGJuBz07U7fV6hEfeUuQv+VI7s6bz4HUWaAc459PQ9ArSLvUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0lj5Vbtc/0agj8ydXCoOMX0vN7usStloTzxJ/q2iJQ=;
 b=Z0qkCT296lTQBKnXhJbS4Ze/f/w8GgJRn32REP/8EM2DcKayIthmy2A2yw0DEskcNa3HQqg0T9nxdzvSVLCNDh1da5/tl3PgknUPiumzPZbMtPAlqn+HGX/EAI93VczTutVr3EqAK3FRFL0Q7vo3lC2Oy4ijAoXOwhPYOgr7UlI=
Received: from DB8PR08MB4986.eurprd08.prod.outlook.com (2603:10a6:10:e0::18)
 by DB8PR08MB5417.eurprd08.prod.outlook.com (2603:10a6:10:117::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Tue, 25 Aug
 2020 13:59:02 +0000
Received: from DB8PR08MB4986.eurprd08.prod.outlook.com
 ([fe80::406a:a54a:e36b:175]) by DB8PR08MB4986.eurprd08.prod.outlook.com
 ([fe80::406a:a54a:e36b:175%5]) with mapi id 15.20.3305.026; Tue, 25 Aug 2020
 13:59:02 +0000
From: "Steve Capper" <steve.capper@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Another test email
Thread-Topic: Another test email
Thread-Index: AdZ659jsQsYg7W2SQBqgysDuqpzN2Q==
Date: Tue, 25 Aug 2020 13:59:01 +0000
Message-ID: 
 <DB8PR08MB4986C28934DB9FDA45D42C7381570@DB8PR08MB4986.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [82.20.117.196]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4656d3e8-f088-49fb-3e92-08d848ff10f8
x-ms-traffictypediagnostic: DB8PR08MB5417:|DB6PR0801MB1832:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB1832D7D0492184FAD34ACBF381570@DB6PR0801MB1832.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2958;OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 u8NbbXOZ6JGTPEFTNwlZiAnzxxB/Bsh1vJJcLHcsDuAX3J8HkQXG2/nag9bkBh92PJz9e7Q6mp50e9Qbq8HNBMPON7BGQsKyVj2JWydIZ4fIFjZnhVEE+Aa3UFrZ+glIqgv3Vn/0qPi+e5EroK8HsQ0gpv1m8+ZPAJMaDalPInLu5+WOocEvR4L526j/4LO4d17APY6NkK4yuzWUhh2ZoAiAUZb/zkyhl5EORvTIonzwsO3ciJObKnybQ7cYVWI0gGXnQKqMz+hNwa6sdkQ/DJ/TbLK0mpbnQOmAR7G+StTC4eLyHppHiiVcfTon/OpC41IWtMIWJkij9B/Fjhml8w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4986.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(8676002)(86362001)(478600001)(8936002)(7116003)(316002)(33656002)(3480700007)(7696005)(5660300002)(6916009)(76116006)(186003)(6506007)(26005)(71200400001)(66556008)(64756008)(55016002)(9686003)(66946007)(558084003)(66476007)(2906002)(66446008)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 mEgD/6iqtV5Sk1J3H1K8Js5TXgAM8ZKKBBce14M9nejxyhz7LEyr5mE4RJyY33lTjmkM2Pdoqkfd6PUYvh0OQrZSVDlKyLBJjx3TiSG8oyz/+ztaHtFh1el3j6m8DNuyqPfzkeyDaGljmY1ltrJ0LVLy80f4RG/nQedGNC5T+N4Cc/b1TXV8jwkipRNYuweHKsLNp408GvMqqQrq4WUHn5Lt3EflTZXf/CnWNzpJ9yiF61XYKTfiJrXc5CHaELXHM9SO3dQIkfkXNqPYS/Lm/hnmViV6YBmv5JCeSoWdIbxz4JZi88UeL73KKQRhMBYfByOa4567ksouEeKO5aDfrPXL0UZpHxDolYTnBp6XMaM9feOE6m0yaY1W9W7TPEDB01+YuqP1sS+s8BLu4COjQ5j49bqDGCt6CBK/6pbG1n+71RYRRRWfukRagL9J+vJU59BfSuUHrRFqVADtCihmufe49+o0HlEOvz1X304rUsI0rIcn4e7UJ9hNw2HfZePKwWIzvs1fweZidLScPju61LFZ9UHnmVf2GwZeUBUHJKp0o+ErfWagRn6v4KiisU6hlYy7RtI8jkxAJDzt/rWrBH7nhIOiFbHAggERxEZfCBZHJVv6M3M5KJF4USkIhfAL7LP7jkfnyyPB0JfoWLNwEw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5417
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Steve.Capper@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c09499b9-593a-4803-50b4-08d848ff0593
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	afkhyUyF/sL+beLUkS18Vs2lMrdw3oHZPg7QhJ+nYWphOHAgw+ZhkExAf5vB2oSIJJVd/YBhuQduAuMiH1kh5HpDRiLEhkJwFFV5TGclTK+GbIboTuymNNTdy9wdchyWpHRTA68yKRjVw8b2oAXZOqw1j4ZKvogBzS45Dp0LqNn3JlG1ou2PH9S/x+PpwJq7QifSu6eHXjc8ivfUnD2eBB3IuEt4DyaVWHdpwmbE7zw66Grtlo5CLLJbqDLcH/e7I+bqhiWpnXcChBQ8RDPo1lVVsrbk9NDKsoMxk5rgg15x/bQfk8s/iXt6IMwUpGbZwwJXwuciLzTGq71Szxz+CTG2MKlMH/vICWLqCB5G6IjZvW7s+BMdptLGkBQVtBrNtoCf96p/wH2I3QrmhupvZA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(46966005)(81166007)(7116003)(564344004)(33656002)(82740400003)(356005)(2906002)(8676002)(8936002)(47076004)(82310400002)(6916009)(26005)(6506007)(86362001)(9686003)(36906005)(7696005)(478600001)(55016002)(70586007)(5660300002)(316002)(52536014)(336012)(186003)(70206006)(3480700007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 13:59:21.0950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4656d3e8-f088-49fb-3e92-08d848ff10f8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1832
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB8PR08MB4986C28934DB9FDA45D42C7381570DB8PR08MB4986eurp_"

--_000_DB8PR08MB4986C28934DB9FDA45D42C7381570DB8PR08MB4986eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this one too.

Cheers,
--
Steve

--_000_DB8PR08MB4986C28934DB9FDA45D42C7381570DB8PR08MB4986eurp_
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
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Please ignore this one too.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Cheers,<o:p></o:p></p>
<p class=3D"MsoNormal">--<o:p></o:p></p>
<p class=3D"MsoNormal">Steve<o:p></o:p></p>
</div>
</body>
</html>

--_000_DB8PR08MB4986C28934DB9FDA45D42C7381570DB8PR08MB4986eurp_--
