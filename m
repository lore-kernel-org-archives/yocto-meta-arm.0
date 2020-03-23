Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.74])
 by mx.groups.io with SMTP id smtpd.web12.53667.1584973640653998393
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Mar 2020 07:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=OMoUP3Wa;
 spf=pass (domain: arm.com, ip: 40.107.22.74, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gsctzYKekLz3/xYZnW4TtEKwU+pPbK0HtJeUe2+MEA=;
 b=OMoUP3Way4t03ozhwxO5fiG6eBu5GT8w4SEbAM1mf8Ru8oICYC6LLO6a2/xYpRAZvOAte5OzJKElhiL5XGO0qXRONNi4Xtzj0snn9OB0Av1koYe+jzBpPdR4tFkfLtCSceCDZqHR85dGvXGSaQuR/F5+ed+cX4aO9AES27NIqwk=
Received: from AM6P193CA0084.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::25)
 by AM5PR0801MB1667.eurprd08.prod.outlook.com (2603:10a6:203:36::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18; Mon, 23 Mar
 2020 14:27:18 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::a0) by AM6P193CA0084.outlook.office365.com
 (2603:10a6:209:88::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.15 via Frontend
 Transport; Mon, 23 Mar 2020 14:27:18 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Mon, 23 Mar 2020 14:27:18 +0000
Received: ("Tessian outbound 88ba19940385:v48"); Mon, 23 Mar 2020 14:27:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1d0c125fc8ffd960
X-CR-MTA-TID: 64aa7808
Received: from ea30f2de7f1d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A004E482-8A36-4FD0-B640-586E0816B64F.1;
	Mon, 23 Mar 2020 14:27:12 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ea30f2de7f1d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 23 Mar 2020 14:27:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPIQLCz/3e1hD3Bu7RxwyhcBbJYFE2wnPVn+9AzggRdZv/sD+QGIs1jdSi7J+uOXEOeWFGwS2OL9BX4kGRJGaCpQOZcMyaXwnt5BbvECSjB2htDFUsZAvfHIfubqCphUcYnbc+/UMpGGo/hR6D5UFly/LBV3rW/KswJfb70O9A/XcRYM1xlvKWv+5MXIgWJvuPUlox3uqomLpR8EZC38WrPuQGXxcXuo5MV33uyqfoZX2YP0elvrMGPfv5vA2CtQ0ubkZgUN7Y+lVm5Lz0Usc9amadGD6Kyjt4WExV+sswSchI55G0wxUsYXe9dneMw9NQ5ALeBmzN8m4kIoQwc0IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gsctzYKekLz3/xYZnW4TtEKwU+pPbK0HtJeUe2+MEA=;
 b=PkVAppXILe+XNa5iS7RmgyVWUU1MBPZDiBA2CoLIKHvCioymudvPbsUOTX/fwCO48uVSq3/nW7mpMp7a2nKFRP11qo18Jou71ks0Ej6ZBWzh3nnHSQdOV8S+SXvOgel926IO8UcR7OnlgpyuJQ8k9mXI+YbnQ2imOHEZawyT7Sr5bHkxBWeqwrGWxAqhfDDJSqXP/JTS6+m03ikm8BSYrixxLEWkIBRCPQMqYULHSc7vjyXa0JEwlErUNa/hRaXBUTGUADigSXR5oueq3jGbcmGWNc5sJRrd11THRrqw4aFQT7A0YAcopBv9cbO2UIqQv0S6W9SwLI9MbeYS+ygMTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gsctzYKekLz3/xYZnW4TtEKwU+pPbK0HtJeUe2+MEA=;
 b=OMoUP3Way4t03ozhwxO5fiG6eBu5GT8w4SEbAM1mf8Ru8oICYC6LLO6a2/xYpRAZvOAte5OzJKElhiL5XGO0qXRONNi4Xtzj0snn9OB0Av1koYe+jzBpPdR4tFkfLtCSceCDZqHR85dGvXGSaQuR/F5+ed+cX4aO9AES27NIqwk=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3371.eurprd08.prod.outlook.com (20.177.121.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.20; Mon, 23 Mar 2020 14:27:11 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 14:27:11 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 2/2] meta-arm-bsp: add layer dependencies
Thread-Topic: [meta-arm] [PATCH 2/2] meta-arm-bsp: add layer dependencies
Thread-Index: AQHWAR5xP/mFi2xLGkGH+PAqWjS5tqhWPAqA
Date: Mon, 23 Mar 2020 14:27:11 +0000
Message-ID: <12A59508-0FD1-4C78-B60D-C555A99E3CBC@arm.com>
References: <20200323142146.30350-1-jon.mason@arm.com>
 <20200323142146.30350-2-jon.mason@arm.com>
In-Reply-To: <20200323142146.30350-2-jon.mason@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d68eca85-9f0f-4908-7a9a-08d7cf364a9f
x-ms-traffictypediagnostic: DB7PR08MB3371:|AM5PR0801MB1667:
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB16673DEF8AD8E341AA87AB729DF00@AM5PR0801MB1667.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 0351D213B3
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(199004)(81166006)(6486002)(66556008)(33656002)(2616005)(36756003)(66946007)(6506007)(5660300002)(64756008)(76116006)(66476007)(26005)(186003)(91956017)(2906002)(316002)(53546011)(66446008)(966005)(81156014)(8676002)(6916009)(478600001)(71200400001)(86362001)(6512007)(4326008)(8936002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR08MB3371;H:DB7PR08MB3689.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 VoPdsUyD8X8G9SQdEsNC/SBpaM58JPmRH7Beg1VsTDPw/PVLPjoZKIhUXCFv2nhZNALsF/ay5BQDufXfj3kOGPUIJ6xt+kyMhDgsdN3KzHHh+J3maYqN8u9UItTuljzWW1W5jkH2YXL6fIxtsLXesjmhyIkNJ+/99iR253YWxsTubvKyABweedpKrof9vbDXnOz/VHn3RESeyXSCoIZwyYtIykXQj5f9ZVldtmq4e1+c69oO1HYKgIyj3RqumbjAvVR4b5qHDc1R5HgwQ64M9AiumFm8r+CJSHJ3eJzeJwdyoKDNFM9tq9yd00af8I84iz7xSbl/HGTC6O56l1caL4rUx/Col5/KOxDYefDHJd1PHLIZlZu56N7QRtm9yAb0d8ICCQlkI5oocYRaNSdkO+19IIg+tmFiPvAoInEaPLI5aAm59ad9teMUd0/bAY2meQ2/v9DwXLrU6CLkOuBXsSWUAfX5nFILjA4WAtxi8cRoOp4N8Ht51vg9epuP3Tu8Nhx9TbWYrRdnkeyffGzmCQ==
x-ms-exchange-antispam-messagedata: 
 4wpuaZqIUnJ/l46FboBRUyCEfD78TkBfYaSuf8QyyhcBTPDW2X5aiZ6OOHFku+8CBWmwlzNfg05BzC5X7i1tVOMPwTxJEgpnZ5uhWCLkdGpfIoUqHLKZFUZiVJWPFqFYZdaWbChW/V7oooks3GDJkA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3371
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(39850400004)(396003)(136003)(376002)(346002)(199004)(46966005)(6486002)(6916009)(2906002)(47076004)(6512007)(336012)(316002)(356004)(2616005)(6506007)(53546011)(4326008)(36906005)(36756003)(26005)(8936002)(186003)(70586007)(45080400002)(81166006)(70206006)(5660300002)(33656002)(26826003)(81156014)(478600001)(966005)(8676002)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR0801MB1667;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fd5113f3-39d7-4524-0d5c-08d7cf3646a2
X-Forefront-PRVS: 0351D213B3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QGj9OoE3T2jmBQ+Ha7/jKUVjboHEE5pKwyhHCBL/i2L/PtK26vknoe3CQsOtgacLEc/2d+ztdrwPldq/LRMOs+rxJnpIKCxlw01/UvhUzZIdzNsiAqTnxx4/5XpJ5wYCcCn6Egvu59//zzG682KckkKgjUTWuMhS3T1ej/yQMZvZCVUB3NCny3rNoS0gOQ6cpnDZDWBgWEaHgldzKFZuumIwF+nGPHp+GaCBCtF9vpB8vGjKoqq0Y5qqLYJr83UxjBfUVOHFQwGVAhAfnDqZDpu7zL6jWT1CNeY9kaJcWlNn8dSycBZyWWlSKZXRXB8G/ojN+RnV4sNZlXaXrVEjqpYi/N5+5OdRYX5v7HtYiq0ZNuipgRTt5ImvfLkXv6lAyVOoHMpplGiskC/SS0TS6ZCPVOMMfYun+EmLVvfgUYANf09DMYPe6N31w/FW5LPZ7mPMlGfq5qnART0yG1qB+Q96CxohpYT2dZr6KIcpKu++Odf2+8sL9EfA+RFRMCbHzexzbmMFLThnaAh19Z6xhztxDjagJTu09AwvGlyQVGjNv0C6WxqrdBMNerOXLlB372evhmSRKS0ykAtw0BoOKg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2020 14:27:18.2302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d68eca85-9f0f-4908-7a9a-08d7cf364a9f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1667
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_12A595080FD14C78B60DC555A99E3CBCarmcom_"

--_000_12A595080FD14C78B60DC555A99E3CBCarmcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 23 Mar 2020, at 14:21, Jon Mason via Lists.Yoctoproject.Org<http://List=
s.Yoctoproject.Org> <jon.mason=3Darm.com@lists.yoctoproject.org<mailto:jon.=
mason=3Darm.com@lists.yoctoproject.org>> wrote:

meta-arm-bsp has dependencies on other layers, which are not being
represented in the layers.conf file.  This causes build breaks when
using tools like `bitbake-layers layerindex-fetch`, as it will not fetch
the depencies properly.  Currently, the dependencies on other layers are:
* core =3D> u-boot, linux, etc
* openembedded-layer (meta-oe) =3D> haveged
* meta-arm =3D> trusted-firmware-a

Change-Id: Icafc2f1c55a6138172706bb4b99e9dc59904cad4
Signed-off-by: Jon Mason <jon.mason@arm.com<mailto:jon.mason@arm.com>>
Acked-by: Bertrand Marquis <bertrand.marquis@arm.com<mailto:bertrand.marqu=
is@arm.com>>

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

# We have patches for xen but meta-virtualization might not be there so fi=
lter
--
2.17.1




--_000_12A595080FD14C78B60DC555A99E3CBCarmcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <9D90FD5B3700224DB0CE5D29871CC15D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii=
">
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break=
: after-white-space;" class=3D"">
<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 23 Mar 2020, at 14:21, Jon Mason via <a href=3D"http://=
Lists.Yoctoproject.Org" class=3D"">
Lists.Yoctoproject.Org</a> &lt;<a href=3D"mailto:jon.mason=3Darm.com@lists=
.yoctoproject.org" class=3D"">jon.mason=3Darm.com@lists.yoctoproject.org</a=
>&gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D"">
<div class=3D"">meta-arm-bsp has dependencies on other layers, which are n=
ot being<br class=3D"">
represented in the layers.conf file. &nbsp;This causes build breaks when<b=
r class=3D"">
using tools like `bitbake-layers layerindex-fetch`, as it will not fetch<b=
r class=3D"">
the depencies properly. &nbsp;Currently, the dependencies on other layers =
are:<br class=3D"">
* core =3D&gt; u-boot, linux, etc<br class=3D"">
* openembedded-layer (meta-oe) =3D&gt; haveged<br class=3D"">
* meta-arm =3D&gt; trusted-firmware-a<br class=3D"">
<br class=3D"">
Change-Id: Icafc2f1c55a6138172706bb4b99e9dc59904cad4<br class=3D"">
Signed-off-by: Jon Mason &lt;<a href=3D"mailto:jon.mason@arm.com" class=3D=
"">jon.mason@arm.com</a>&gt;<br class=3D"">
</div>
</div>
</blockquote>
Acked-by: Bertrand Marquis &lt;<a href=3D"mailto:bertrand.marquis@arm.com"=
 class=3D"">bertrand.marquis@arm.com</a>&gt;</div>
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">
<div class=3D"">---<br class=3D"">
meta-arm-bsp/conf/layer.conf | 2 &#43;-<br class=3D"">
1 file changed, 1 insertion(&#43;), 1 deletion(-)<br class=3D"">
<br class=3D"">
diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf<b=
r class=3D"">
index 931b54c..0632ba3 100644<br class=3D"">
--- a/meta-arm-bsp/conf/layer.conf<br class=3D"">
&#43;&#43;&#43; b/meta-arm-bsp/conf/layer.conf<br class=3D"">
@@ -9,7 &#43;9,7 @@ BBFILE_COLLECTIONS &#43;=3D &quot;meta-arm-bsp&quot;<b=
r class=3D"">
BBFILE_PATTERN_meta-arm-bsp =3D &quot;^${LAYERDIR}/&quot;<br class=3D"">
BBFILE_PRIORITY_meta-arm-bsp =3D &quot;6&quot;<br class=3D"">
<br class=3D"">
-LAYERDEPENDS_meta-arm-bsp =3D &quot;core&quot;<br class=3D"">
&#43;LAYERDEPENDS_meta-arm-bsp =3D &quot;core openembedded-layer meta-arm&=
quot;<br class=3D"">
LAYERSERIES_COMPAT_meta-arm-bsp =3D &quot;warrior zeus&quot;<br class=3D""=
>
<br class=3D"">
# We have patches for xen but meta-virtualization might not be there so fi=
lter<br class=3D"">
-- <br class=3D"">
2.17.1<br class=3D"">
<br class=3D"">
<br class=3D"">
</div>
</div>
</blockquote>
</div>
<br class=3D"">
</body>
</html>

--_000_12A595080FD14C78B60DC555A99E3CBCarmcom_--
