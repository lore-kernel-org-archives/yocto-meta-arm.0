Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.78])
 by mx.groups.io with SMTP id smtpd.web11.53841.1584974180526785345
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Mar 2020 07:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=BiKspkPG;
 spf=pass (domain: arm.com, ip: 40.107.3.78, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Pwq1gSU6lQUAZyQGMjgnrzhEx9yjSt+lWdXJ/HkbVw=;
 b=BiKspkPGJd2nfX9FEh6U5jvoLl+58YcxxQ5ZZIxViowY9dk9HMajDi3hl08gp8Mv4LmbfXXBwO4mVuC7eZ0yZdwMKjmW3Qj9UyCcNGBvTkTgy+vnn5f3CKWqodm8K5sHxV96rq6CGKDjtaaF6FhpmATcD8YUil8Eu/oYrTAJZo0=
Received: from AM6P192CA0074.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::15)
 by HE1PR08MB2922.eurprd08.prod.outlook.com (2603:10a6:7:2e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18; Mon, 23 Mar
 2020 14:35:13 +0000
Received: from AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::4) by AM6P192CA0074.outlook.office365.com
 (2603:10a6:209:8d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18 via Frontend
 Transport; Mon, 23 Mar 2020 14:35:08 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT028.mail.protection.outlook.com (10.152.16.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Mon, 23 Mar 2020 14:35:07 +0000
Received: ("Tessian outbound 0e34ea672d09:v48"); Mon, 23 Mar 2020 14:35:07 +0000
X-CR-MTA-TID: 64aa7808
Received: from 4a137732597c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0AAC1BB6-2DA8-47A2-890D-8E6F9C717CE1.1;
	Mon, 23 Mar 2020 14:35:02 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4a137732597c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 23 Mar 2020 14:35:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcWZZwmW76Qo+VKtjhA3RK90197PdYTZLPAU6a55QsRpPbQytWZ10box8YPgPW6zsdeuB7IJG6HgQiHjEtOidoze8dq9kDPftAJ6LLKZf97N8sxrcTrI6PX4cMJVn2xhGtFev7ZmzBvQcRAzfpIz267xyw64XnfqCxPEYwlxNqLW/9To5op7PDHmKCG3UtfhxEiMuVim6PpVruYCzCQD5gHFSuufDLJCoWi2ipC2JSCQ2J7+SKoEE8vTjFcxmzNNP1RDFki51wbi4YZ/FplsCPgpRxGrpEdzNe6ShWuIZNmNCIffExobIP1fAjklIZ58kRYiA/rGnCtdlCi/zQSyjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Pwq1gSU6lQUAZyQGMjgnrzhEx9yjSt+lWdXJ/HkbVw=;
 b=l4GD3QfGVvniHb5EnD+S135fvaPh4H3PJl7Q+ESe1HUablyPej0h/3jLCUVw46stOtfFSDZJ+bjEJDRAXbGQPpUIUgdwiGDavoWvhsKpyJXfx8NN8BP6bwN0ZRjEH3veUkWfa8FLy8g5mixumAgLWRS4XyrO1+xn2ASLz85K3YoHC4O8Vd9uRGWIKkCvTEWAtLBeBaI5AMOh7fxIL4us4coi13W2PWVxVO4ev8gpRTZ6z+QsVpy+W5juWz21b+ROB0hpuATxEh7BMYbRYDDf1SM5ATFNqfToilPMmP3kOPRqPWflPFU/fWRX/og9WUo2703ZC2gfcYXbWA6WwWwAXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Pwq1gSU6lQUAZyQGMjgnrzhEx9yjSt+lWdXJ/HkbVw=;
 b=BiKspkPGJd2nfX9FEh6U5jvoLl+58YcxxQ5ZZIxViowY9dk9HMajDi3hl08gp8Mv4LmbfXXBwO4mVuC7eZ0yZdwMKjmW3Qj9UyCcNGBvTkTgy+vnn5f3CKWqodm8K5sHxV96rq6CGKDjtaaF6FhpmATcD8YUil8Eu/oYrTAJZo0=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB5236.eurprd08.prod.outlook.com (20.179.39.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Mon, 23 Mar 2020 14:35:01 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 14:35:00 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 2/2] meta-arm-bsp: add layer dependencies
Thread-Topic: [meta-arm] [PATCH 2/2] meta-arm-bsp: add layer dependencies
Thread-Index: AQHWAR5ySH/IPWzXWUapY2Jl3t2GYqhWPAqAgAAB0JA=
Date: Mon, 23 Mar 2020 14:35:00 +0000
Message-ID: 
 <AM0PR08MB398740F765627173E4BB0CD992F00@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200323142146.30350-1-jon.mason@arm.com>
 <20200323142146.30350-2-jon.mason@arm.com>
 <12A59508-0FD1-4C78-B60D-C555A99E3CBC@arm.com>
In-Reply-To: <12A59508-0FD1-4C78-B60D-C555A99E3CBC@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: f2df315b-e67c-4ce9-8a29-6d8dd9759050.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a0fcc7a7-032f-4ad7-fa4a-08d7cf376296
x-ms-traffictypediagnostic: AM0PR08MB5236:|HE1PR08MB2922:
X-Microsoft-Antispam-PRVS: 
	<HE1PR08MB2922FA670662BF7B93418E5092F00@HE1PR08MB2922.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
x-forefront-prvs: 0351D213B3
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(366004)(39850400004)(396003)(346002)(136003)(376002)(199004)(7696005)(5660300002)(6506007)(966005)(2906002)(316002)(52536014)(478600001)(6916009)(81166006)(81156014)(8676002)(8936002)(4326008)(71200400001)(26005)(64756008)(186003)(55016002)(86362001)(9686003)(33656002)(76116006)(66476007)(66556008)(66946007)(66446008)(16752965003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR08MB5236;H:AM0PR08MB3987.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 1YhUtOh4ehjFvYoUgjV8JfBq7YzeloVi9zKS/OzmSapPYef3ow4syFZR8cuPhCtKzCeqCx7jSejy9gjVZr9GNKLRI635BCG641oko/IfHw4cESIt+OZ0R2TgDR8o+vL7Zmah+M/xS351Yaib2MS2TEgLmOa3vIH9cZPw8QAc1QP8HfLfUk0pqsG23/aEXAO93Zyl7tQmqFYTDlFgkIcv099V7JWZWBN1vJtKQmR1iIZDzwlHhmvE6ZVmN1nhe+wDv8LzpVDsbjJ7cNyVX4fdwnKPifza7ZbSK11zUX9t8eK4ibs10VSk/3dvO7j6JslmLYzMDwVdgrVy2LlArlpH/7mExH7r0e4e8hZHhdEYbMPN7/6gpUr+PXYtLHSWWgis9rvJvqajKPDPTTbg3hIkPJ5RTiu4heDhvkJbuKjKcywB6JkZq/GLypAzmnsShCxllKynmstN/6Y0kvUARscaM/Vtz72e+1FRdmN/NxBLE/eWjuqLbmBBqDgSA6yxFzIpQF/h2GrgCJcDnbW8cUj2THaipnY/y1mOH9lGWmwmSuZbrmWgt3iinIjdhrtM1MAP
x-ms-exchange-antispam-messagedata: 
 qyetRXNfhK3G28J45wnPSNxnfx4K8Ja7Esi3WCE2Tr/QP8LILSH5AJT43WHNmaEIO+WWmdmQSeLnJKGsvSi3LcfCO5lhcMoJ78KuEx82CnAnn68uZk6xyVOypR7Y1gkRPKz2TjOrwmHy0tlBOJCIRA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5236
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(199004)(46966005)(81156014)(8676002)(52536014)(86362001)(70586007)(81166006)(8936002)(336012)(2906002)(33656002)(186003)(356004)(26005)(55016002)(36906005)(7696005)(9686003)(6506007)(6916009)(498600001)(4326008)(5660300002)(70206006)(966005)(47076004)(26826003)(16752965003);DIR:OUT;SFP:1101;SCL:1;SRVR:HE1PR08MB2922;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	57dfec86-d512-43f0-5b7a-08d7cf375e5f
X-Forefront-PRVS: 0351D213B3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TmC4P7rB6Df+fNDWRBpcpHgF5OIO7sEyyWy1bW2IaI8bNo90PAcrFBppMTsIzIT2jW/QdRmkCyBdgh0e/A0Z9GGA5Ea4EbAn4JybX3KsvIES3/57Sz+ZbCFuFyl/qTQrWvS8ZMMej6zqmK8nxfqZJ6/jwAQhCfxz+Ws958GLJZ85t2VeQRwnlnI7JKi3cN7nnE+z1XhWvo4q6iDLGi39kIrcY8jbpZwnEPSDV3s00alSrMZ7zrhCuwxebF5soKcQruc0OjgxjKTsykN8FtN5dK4oz2xFL63vXnBb4eiank66Ls0izN15AdxmjbSueQmxIFbHFEXx/loIt20HPo4P3Pih3ZPfawlADC4tYIdaxcLsFtvMyUZR7NEYObpsKch6dDdpuvLdZGTor9h/i89CzEUOFyVAb5jzEMup9AyF+Eam6AWUzgQKNFY2vehpWIWxuM4Lm3JL5Lt4IfCCJrWEAl44Y1G+fGacXnnGSeHisXI8L0N5QX20syxOcDWzSeuy4RRW2/qgkIJmPbkNZDbqwgc6dzO8PJ4kDxuyQFBIyaSdy8IcIKu4XxoI40Vhh4gUWFTaRLOwJjC/3Cx92jca+w==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2020 14:35:07.9826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fcc7a7-032f-4ad7-fa4a-08d7cf376296
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2922
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On 23 Mar 2020, at 14:21, Jon Mason via http://Lists.Yoctoproject.Org <mail=
to:jon.mason=3Darm.com@lists.yoctoproject.org> wrote:

meta-arm-bsp has dependencies on other layers, which are not being
represented in the layers.conf file. =A0This causes build breaks when
using tools like `bitbake-layers layerindex-fetch`, as it will not fetch
the depencies properly. =A0Currently, the dependencies on other layers are:
* core =3D> u-boot, linux, etc
* openembedded-layer (meta-oe) =3D> haveged
* meta-arm =3D> trusted-firmware-a

Change-Id: Icafc2f1c55a6138172706bb4b99e9dc59904cad4
Signed-off-by: Jon Mason <mailto:jon.mason@arm.com>
Acked-by: Bertrand Marquis <mailto:bertrand.marquis@arm.com>
Acked-by: Diego Sueiro <diego.sueiro@arm.com>

---
meta-arm-bsp/conf/layer.conf | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 931b54c..0632ba3 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-arm-bsp"
BBFILE_PATTERN_meta-arm-bsp =3D "^${LAYERDIR}/"
BBFILE_PRIORITY_meta-arm-bsp =3D "6"

-LAYERDEPENDS_meta-arm-bsp =3D "core"
+LAYERDEPENDS_meta-arm-bsp =3D "core openembedded-layer meta-arm"
LAYERSERIES_COMPAT_meta-arm-bsp =3D "warrior zeus"

# We have patches for xen but meta-virtualization might not be there so fil=
ter
--=20
2.17.1


