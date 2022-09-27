Return-Path: <Jiacheng.Tang@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB86EC54EE9
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 13:34:34 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.69])
 by mx.groups.io with SMTP id smtpd.web11.11140.1664285671061464150
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 27 Sep 2022 06:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=p64dgxPU;
 spf=pass (domain: arm.com, ip: 40.107.22.69, mailfrom: jiacheng.tang@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=f97lpI62qMK1LQXeOa4Z9hcpBqbbMTHmdCmQqScbOwgDMEN3MmxZVSPfp2vd6aJboBEwvuDDOiNgr+NYMU/wZN0eSINqU0kvGN9Y39nsBLItO/a70+KIJ9ecswvFbVWpIOtaZkNLOuJxRvI/hHSHIzx7ElbIp6lI/N0kqCNnqLOCUpXVS+yM69iYwP88htXJPWB046cCpuTt71g4EI0QwjTqDZBV3yKrDYMzyiutMW1NwzntaWe+zwfHBWlWsJmkErYxc2F/jf/BwQiP2cMnEm5+lGECdS85UEDYSgumL8u/Cwp57qgO6dnsk14ESA9plRQ/ZncCA8DMGSYKVLa9NA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DDDEkartpFB9PDvWdo393iedDgu+C/cknNx6+/ZedZE=;
 b=asIayPNPEmd/anW+yghcgI80j6J79zi3JRLDZOWn0n2Q2vDz0YCwbKCOhFZwfCD2rdgkbiEvnW0mHfdG1MKz0wdx1k/4U0htHxVJkFDnY1TdhhMUlF7nN56woppjrwcnMdf+jzWRvWunRZqOw5WAmBby+oxWEGDCOe8XEkVLNTuORe9Ohx/sEq+OCnvIH551+5nGjtVIT3irnMgIxlc8hTLa864cAtgZVozHgKWx7LKlSB0sR3kywfUGCSDb7qaVI23ESFy3luoK0mb7MFRnGwpBCAEnyIb+Y77iixrvQEsyItG0Gov/hDReZOmU1SvEab1nQU6HmP4Tz7mqyzqr7g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DDDEkartpFB9PDvWdo393iedDgu+C/cknNx6+/ZedZE=;
 b=p64dgxPUUabGWqVjWDAJdIWXKl+/OUKWiQg1hAY0cQ0cPkBALvOt2l+VRSqiP/EihaYEJS3DPkd7Lnv3VfQFRqBpT0v5etwA88TZo8zEEM8V6N7Ty79u0FguwFUHEo9nJQ7hYYBkDG4RV2MIuGc8XDy4R/C5KBsLZGXsU/KcO10=
Received: from FR0P281CA0039.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::22)
 by GV1PR08MB7899.eurprd08.prod.outlook.com (2603:10a6:150:5e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 13:34:27 +0000
Received: from VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:48:cafe::65) by FR0P281CA0039.outlook.office365.com
 (2603:10a6:d10:48::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15 via Frontend
 Transport; Tue, 27 Sep 2022 13:34:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT053.mail.protection.outlook.com (10.152.19.198) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 13:34:27 +0000
Received: ("Tessian outbound 937eed45f6ed:v128");
 Tue, 27 Sep 2022 13:34:26 +0000
X-CR-MTA-TID: 64aa7808
Received: from 70f36f8b1b80.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C37893FA-9703-49D7-8EC9-0A543CA2F5E8.1;
	Tue, 27 Sep 2022 13:34:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 70f36f8b1b80.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 27 Sep 2022 13:34:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnCFtCABACZhKUBH1E+FLFsFVH9LoyWWbMgllFQu2XUJ3OLMsqg7BeB0v+XT3F6IS0LZd/+uhEBT9Xk+B5jt03u66G7GzrxjTyGyzvY9RbLEYo7pW0CA2bymmTzUGyzEj2hVOf2yt0dRbQwYtdUbozzXR4rgNlYAKh87Xy/t5HDRgXFiAYXi6e4lVILeIwfSnYTJziZZJ49VcEtGuvZrlBzVaDVZN9XhkzWRhHjH3Kk7vOEMQHsgVgOvd2e11s+iyom/4eGia8pFaXhlcUgJ4YqsBHgFlglAuL5OoLB4Wwr/ihQXQJ2N+5T6CXdji1yIE+d5alfWho/WscBEgH6toA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DDDEkartpFB9PDvWdo393iedDgu+C/cknNx6+/ZedZE=;
 b=YTxoVixUA3gQM1hsXJlfCmFk7g02e9J7a923se5S9c/UHYPSeT1vOzSknKMQXxzfLplSMXclMt9XRKKZ31T/BbB9dmZSx43UeS8M2ZpIk9nmUHhNujurid+9bZh71nfvAsSPBhc55ATQk0Mp54QQMIifEXWBQt0uKYvYP270EAYMpCytJW5lEWts49comvQr9D9Alo/hdHwvi6tI1eM16a37mKFLxCTc2XKEArChRSSw2Mkgm+/wLjSxkWEGNk1XgFc+Ror0XFjbYTp3Hn5cTdDqlwAOi/H78vqLWBHvPZoTOvpfMTUjjdydp7IlvtWszMWkJv0hybCjyB9Ojw32Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DDDEkartpFB9PDvWdo393iedDgu+C/cknNx6+/ZedZE=;
 b=p64dgxPUUabGWqVjWDAJdIWXKl+/OUKWiQg1hAY0cQ0cPkBALvOt2l+VRSqiP/EihaYEJS3DPkd7Lnv3VfQFRqBpT0v5etwA88TZo8zEEM8V6N7Ty79u0FguwFUHEo9nJQ7hYYBkDG4RV2MIuGc8XDy4R/C5KBsLZGXsU/KcO10=
Received: from AM6PR08MB4983.eurprd08.prod.outlook.com (2603:10a6:20b:e4::14)
 by DB9PR08MB9515.eurprd08.prod.outlook.com (2603:10a6:10:453::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 13:34:17 +0000
Received: from AM6PR08MB4983.eurprd08.prod.outlook.com
 ([fe80::7c9f:1c89:b6bc:2bce]) by AM6PR08MB4983.eurprd08.prod.outlook.com
 ([fe80::7c9f:1c89:b6bc:2bce%5]) with mapi id 15.20.5654.016; Tue, 27 Sep 2022
 13:34:16 +0000
From: Jiacheng Tang <Jiacheng.Tang@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: [PATCH] arm/fvp-base-r-aem: upgrade to version 11.19.14
Thread-Topic: [PATCH] arm/fvp-base-r-aem: upgrade to version 11.19.14
Thread-Index: AdjSdZVxBrPUy9HeSu2A4GSee87Ssw==
Date: Tue, 27 Sep 2022 13:34:16 +0000
Message-ID: 
 <AM6PR08MB4983060AEB47EBEE2E2020CEFC559@AM6PR08MB4983.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 6D50EAAC83450D4EBD42968375A6BD31.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM6PR08MB4983:EE_|DB9PR08MB9515:EE_|VE1EUR03FT053:EE_|GV1PR08MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: ecf7a96d-4f63-4ced-8d9e-08daa08cffb7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 x+kx+pfHgTduWGE3UQGi6xahoqRPZXbbVNOSzeLdWQ+P7Nd+wS/RBx5p/hArx1EjOI0ehI8Z2x1f0ELHXeax9AZ9KtKYuX2ingEoent51eQczaIWo1zE7ASn+yJsi16bleB67PrSeyZvPZjzDRlzewHNvnc92n7SgDTcy3MpxoVpt5n/fJuCKBnl3pah4QTrvw/r4G7Pma41vIM4fSxlApo6KGZnHU93ZUqJozzLzQURCVidKG1gOP/8Z0K4S4ds302jYQ10/hXj/F2IX4kSkVVtbolT/Xz+IM/uW5MqOGzUN0D5jcYkzRc535iH898tZtqHBJOrzvnAoMxeFb1WlWV6gNPWNW0U10X2/qVIQB0FqYuKShnwGS8YwAlU+bK9iTct6zVfc/0Suyyq59c/+e3yl6e2zaCu0VP9wNk9U7c25fQqvZ1mnaaGhTqSSZlSxyGEtgjgM81hXBKjPiivrAmyVOH3p1DdSp6Z6GCYE3NhFOfYPraGeJ4rPphh8oOSNFZBFd/vXnC0FISV5OlvnJrIB/D38R13e54vczYk1Clh54CcynTd5gCuMGH/CRxSgnbz21ZUdymtxZsamFYlGStNzKJsE3g9OqZAh8TtIPD9Tasl1zifwcBpPKC9HD/OUyQIKVTguLcB7gIFNHyczkPv8fv8rvztRbMHn5YvIpKjVKI2M8zFg2+4Mhk88DGwwN86PGma5YhOUJXKkQR7t33QeDo/NCdUdSnF6Hr08I8uAguTMGWS2LO73nDVF8l0IlTpbc1DBYLmeCBwsp+p6OsMFEV/+ocppS68WudysKw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4983.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(376002)(39860400002)(346002)(136003)(451199015)(83380400001)(86362001)(71200400001)(41300700001)(38070700005)(316002)(5660300002)(186003)(2906002)(558084003)(7696005)(6506007)(478600001)(122000001)(6916009)(38100700002)(8936002)(76116006)(66476007)(8676002)(66446008)(66946007)(66556008)(9686003)(52536014)(55016003)(26005)(33656002)(166002)(64756008);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB4983060AEB47EBEE2E2020CEFC559AM6PR08MB4983eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9515
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1f59a66f-0c85-4565-3387-08daa08cf96c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PQzf66lCt0Q8wXtM3fwWEc3Z/BT+Sx1JQTj6m6HcGtcSihry3kd1gI8y8tgNIQPJDBX0vQ0s7C/noXJpXsnFt+4Yfrh6KP7a+9szn7fRkeJKVmU51/s0wK/GK0hK1VCDmnWIHkLkz0DjQSZgOR6G2BzNbmu99OXvB695p8DhlhE/XZ2EW8JnEMw0JWb4w6qPYeWd78XX6lwFXb7v50GY6N4EpkFgvV2xEgV9vFP4CQCpoozc3w+IvvMzYr+xa61wmac5IDlTEvBNSieewWvLeXgJxv4R4QVmhtVSboOzkN/KSd7mXtn07RWlGiaCV45wCr2f9zk1jomAzH91vSFFifWzKdmzg94zNX74sbCbrNvLMg/s3b/JipzWFs6W5gmL6Ou8NUsBZKjU5pABXTxapCjtJya/ZVLfR539xQsqhqbcbcxjoHgvyw44PapS9dVkpjY55l5FveaFWqOAzfvsiyFJ+ZQB/xC8OAWlu94r2Wz23ZXGvlZRFDlkBRCgO7IDoMOOfT0ZIbPoBdX0dPymbz9LnJeE5MaLHTBq8+iDNAfWyDXzKOQJNy5Kfa1PSy5TEyGAPsMO6V94HnhcbIsC7a5geMo7wUV+4fpi633wwklPJxlHPz+XlRtUSR62YecP7MiYqNiGWq6br9imXW0z8E4LB/nPcNkjNuIj1iZ1oxH3qfINOHjVJ19EKXNkdykbdIPxiZldQ/AE8mBR2l7PY+sfocM+RbzZoCvIEw9J4h5+FXmDQupK8U85yFE8gSMyxAJw9assfRkpPcF5OWLTdcarKyjssecxzkjVKe9zLv8=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199015)(36840700001)(46966006)(40470700004)(40480700001)(33656002)(82310400005)(564344004)(55016003)(47076005)(478600001)(6506007)(7696005)(26005)(9686003)(83380400001)(8936002)(52536014)(86362001)(2906002)(40460700003)(5660300002)(186003)(6916009)(82740400003)(70206006)(316002)(36860700001)(70586007)(336012)(81166007)(8676002)(166002)(356005)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 13:34:27.1323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ecf7a96d-4f63-4ced-8d9e-08daa08cffb7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7899
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 27 Sep 2022 13:34:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3846

--_000_AM6PR08MB4983060AEB47EBEE2E2020CEFC559AM6PR08MB4983eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore the message #3845<https://lists.yoctoproject.org/g/meta-arm/m=
essage/3845>  - this was intended for kirkstone.

--_000_AM6PR08MB4983060AEB47EBEE2E2020CEFC559AM6PR08MB4983eurp_
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
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
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
<p class=3D"MsoNormal">Please ignore the message <a href=3D"https://lists.y=
octoproject.org/g/meta-arm/message/3845">
#3845</a> &nbsp;- this was intended for kirkstone.<o:p></o:p></p>
</div>
</body>
</html>

--_000_AM6PR08MB4983060AEB47EBEE2E2020CEFC559AM6PR08MB4983eurp_--

