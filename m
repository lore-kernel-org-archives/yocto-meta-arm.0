Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.44])
 by mx.groups.io with SMTP id smtpd.web12.1765.1585727616154224360
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Apr 2020 00:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=AXKObVqQ;
 spf=pass (domain: arm.com, ip: 40.107.13.44, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVkFU3p4g6MzGX49ETFjCeRHYOoDW2monKsqmGXDQ1A=;
 b=AXKObVqQKQkdJjrkAh5CbMA8YRb4M4tOf20NqwS3fvfsEZ/kURPv7xxYJNR+1szeQ+z+lPO/h82b/qczTp2JOU2L2tMhsMbeguL+dOfFCiqix8G/DNx0/hHAQuv5QMcCISB7o5xP8FWG1izK2dTcT/4jagE82rnBZXg9+rpcxjg=
Received: from AM4PR0701CA0035.eurprd07.prod.outlook.com
 (2603:10a6:200:42::45) by HE1PR08MB2812.eurprd08.prod.outlook.com
 (2603:10a6:7:34::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Wed, 1 Apr
 2020 07:53:32 +0000
Received: from AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:200:42:cafe::e7) by AM4PR0701CA0035.outlook.office365.com
 (2603:10a6:200:42::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.9 via Frontend
 Transport; Wed, 1 Apr 2020 07:53:32 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT050.mail.protection.outlook.com (10.152.17.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Wed, 1 Apr 2020 07:53:32 +0000
Received: ("Tessian outbound 1425309d4c0b:v50"); Wed, 01 Apr 2020 07:53:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 20ed040226276825
X-CR-MTA-TID: 64aa7808
Received: from ec7fcf9707c1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 985D488E-C081-4A53-BF32-BC6363C0A1A1.1;
	Wed, 01 Apr 2020 07:53:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ec7fcf9707c1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 01 Apr 2020 07:53:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bt6VQgm76dFEd/bSbH4Dv3Ef1VQYgg8ws6Vxpp+XP8jEojhIbbAOcywpTg/k1aIVKSX5A8hMAhNH9yg7FC0QmVnFjomhAEBowe/7ie8ajaTmoXD9xRoArgw4ndjRsiAyfaLdjki3WesqDHdQlIQ7oxFx5wxSDvL4vmMBaV4t/BD4IID2Zf96c0slSGjOFxoKWK8VIlweEFt4RmeuzGgzKAra+lq3CNU95Xo3b8j3aZWmGmIZEmFSFCQCcEcJufOiDG02qpULRsk7wYHRTwrRRRDRlgKmI88yMy/BqqNeysiv5bViTySN4DmVqie9pGMLfULwQyju/I9NPh4C0VYCRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVkFU3p4g6MzGX49ETFjCeRHYOoDW2monKsqmGXDQ1A=;
 b=GzRD6uk0IHLKXvtsSv5UkN4ntH4Fd/mEImFCK26SDM0GKBMIO+GxmSAIaxAD84OEDXMNYpA7amRcleD4fNNQqPqf4WqBe1BFHZyXM2jBZeeeROwuTkEZDI2oNXYn4m0Sf/cn+qDGXgG42HPBZbkSHonHfNviW38vjMuK+8fOAYvjAXg4DrK+M1uujC8/Y7mvWZR1bViBvTOAubEKCGG0pUFrgOuK2A/7JQZXUSP+8IAL6GyGb5sjpvD/whawNpfPQ+k6pEeb178kO3so3VEdIeSPMxx/wl5iVr6npmSyvJWyqN0rn4p3PC35cuybQp/pTxLLUG0XHgpGz+WeF8YF8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVkFU3p4g6MzGX49ETFjCeRHYOoDW2monKsqmGXDQ1A=;
 b=AXKObVqQKQkdJjrkAh5CbMA8YRb4M4tOf20NqwS3fvfsEZ/kURPv7xxYJNR+1szeQ+z+lPO/h82b/qczTp2JOU2L2tMhsMbeguL+dOfFCiqix8G/DNx0/hHAQuv5QMcCISB7o5xP8FWG1izK2dTcT/4jagE82rnBZXg9+rpcxjg=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3481.eurprd08.prod.outlook.com (20.177.120.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Wed, 1 Apr 2020 07:53:25 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 07:53:25 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] layer.conf: update LAYERSERIES_COMPAT for dunfell
Thread-Topic: [meta-arm] [PATCH] layer.conf: update LAYERSERIES_COMPAT for
 dunfell
Thread-Index: AQHWB5aZaMa1TkS7GkidZHbDRXGw7Khj5hAA
Date: Wed, 1 Apr 2020 07:53:25 +0000
Message-ID: <4C6F3AB1-F166-419D-843C-7B4F11367C77@arm.com>
References: <1585684637-53492-1-git-send-email-denis@denix.org>
In-Reply-To: <1585684637-53492-1-git-send-email-denis@denix.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e757a9ca-af77-4b52-360d-08d7d611c625
x-ms-traffictypediagnostic: DB7PR08MB3481:|HE1PR08MB2812:
X-Microsoft-Antispam-PRVS: 
	<HE1PR08MB28124CE5D71FBF6E3D293B929DC90@HE1PR08MB2812.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 03607C04F0
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(2616005)(81166006)(8936002)(8676002)(6506007)(478600001)(53546011)(5660300002)(81156014)(2906002)(86362001)(4326008)(33656002)(66556008)(26005)(6916009)(6512007)(316002)(36756003)(91956017)(66476007)(6486002)(66946007)(186003)(66446008)(76116006)(64756008)(71200400001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 xI3e37r04rtXBGRExWAx/dzgJ9JVDz606qmsHmbXC74iBKcsp9EewT40ZVXDOAai+PElgqFARuLDmrH/9TpWjjv+3UP1fc2ThBQbhAgUMjwVThSfGTAI42OyVgPk4lapiRtmUH1Wy9gXcLAORW/bK24G6Rc0Lbl6d35l5J1wPjHf1u9uVp7ao4aVO/rzuRtdTcz7CynKLOgY5vMZFe/ZgMOr3BzJIV1iYvIPpRDUCBWzojHIZ7jGCZ9FQ3hP7fyakwk0iJxaN4wcYYQALq4dUyo2p4OBhaceHlRHFV2gUVt/suzJQfH8QXoqwbR/bkHNPX9LW7D6N24dv21oDWs2127v7DqZt9zPJEe4CFrbLWx1oz26hu13dvnJTcfooc1YKv7kvXi8012MhT02jmm46hgXB3kNGZENmP5u8UemJaIyF1isOGxnzx/nSCuJ2zuowbOHJURWN3OrKsbOGKUTnKSmANVqMJ2fXb8ZDK4MAX4jL3EQG3Ty4IamirRD4trH10EY7dNl9IiH4Hj+Q27gwg==
x-ms-exchange-antispam-messagedata: 
 1dPP6cpfzVRyG+GrKe52//og7tV7vvDHRKfn0MLADfpk9qeabEU/mxFwBZ0VWsSgYEI0XtsQ6mdWYfEZEQJRL+FkO8WECznG8t/6BfveSB8VJFUzW0bVeRez0HXos5vSOftLYGN7a7sC0JDE/AXIOg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3481
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(136003)(46966005)(70586007)(5660300002)(186003)(316002)(26005)(6512007)(6486002)(33656002)(2906002)(6506007)(45080400002)(36906005)(53546011)(36756003)(86362001)(336012)(8676002)(70206006)(82740400003)(81166006)(8936002)(47076004)(4326008)(478600001)(26826003)(6916009)(2616005)(81156014)(356004);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c6de98f4-80be-434e-b858-08d7d611c1e8
X-Forefront-PRVS: 03607C04F0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	o+V7n5fi3UXkVDxGNbI75YoHbvumVGNrmbdPTxSF1/V4cc/jloJRlJi046oLrgKZlrLTEv0cXU2dhYlAs5uL3Njjap482jY6h1djfYMa+UiDCwcr6nxr7s+XKvCEjG/CtZRMAC8BOoKqAdjo0GC3AlbezQ3+snJ93GBippuWyhtn256O+yHqpBy4S2nH6sv/mWqebOAnzDaM37DrIQrGd2lNUpMzkWRkjEXiJbwB9tW8iabY3pm9VWb26hs8TTlnPc3BqGQ6t55h/dWTni6j+78VG/yySjkUGFcc3yLFO6Am14n1U8xGdeWSK0OeIkKrxHDqRDbhOzvaKgvDbiSp4RZVF6CI73sq8kIYJQvUtGTfzXnrPxjWja3LZDWn1jYyGKopceJRYt6U8S4ywuTPgVHEip2G4+N2Ozcz/mNxCmERJz5RsQvoCWX+2NtQsAxcQw+1aVv75c6t4Ty0r3zyDvzMwgOoep0pPfAxMUlSdkCndui5Al+nekmefQ9XYh8PkBZ5CWpwAGsDVIVLe+BGCKjVhywaUaKRCPIIwCZq+9wmeak2Z6DzpCCeYiy2orY/jvG12nX4YMlkHP36ikiAug==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2020 07:53:32.2689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e757a9ca-af77-4b52-360d-08d7d611c625
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2812
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_4C6F3AB1F166419D843C7B4F11367C77armcom_"

--_000_4C6F3AB1F166419D843C7B4F11367C77armcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 31 Mar 2020, at 20:57, Denys Dmytriyenko via Lists.Yoctoproject.Org<http=
://Lists.Yoctoproject.Org> <denis=3Ddenix.org@lists.yoctoproject.org<mailto=
:denis=3Ddenix.org@lists.yoctoproject.org>> wrote:

Signed-off-by: Denys Dmytriyenko <denys@ti.com<mailto:denys@ti.com>>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com<mailto:bertrand.mar=
quis@arm.com>>

---
meta-arm-bsp/conf/layer.conf       | 2 +-
meta-arm-toolchain/conf/layer.conf | 3 +--
meta-arm/conf/layer.conf           | 2 +-
3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 0632ba3..8afcbe5 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -10,7 +10,7 @@ BBFILE_PATTERN_meta-arm-bsp =3D "^${LAYERDIR}/"
BBFILE_PRIORITY_meta-arm-bsp =3D "6"

LAYERDEPENDS_meta-arm-bsp =3D "core openembedded-layer meta-arm"
-LAYERSERIES_COMPAT_meta-arm-bsp =3D "warrior zeus"
+LAYERSERIES_COMPAT_meta-arm-bsp =3D "warrior zeus dunfell"

# We have patches for xen but meta-virtualization might not be there so fil=
ter
# out recipes-extended/xen unless xen is activated in the features
diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/l=
ayer.conf
index a247dc1..3a4c4f0 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -8,8 +8,7 @@ BBFILE_COLLECTIONS +=3D "arm-toolchain"
BBFILE_PATTERN_arm-toolchain :=3D "^${LAYERDIR}/"
BBFILE_PRIORITY_arm-toolchain =3D "30"

-LAYERSERIES_COMPAT_arm-toolchain =3D "zeus"
+LAYERSERIES_COMPAT_arm-toolchain =3D "zeus dunfell"

# do not error out on bbappends for missing recipes
BB_DANGLINGAPPENDS_WARNONLY =3D "true"
-
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index 65ccd15..0b93e8d 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -10,4 +10,4 @@ BBFILE_PATTERN_meta-arm =3D "^${LAYERDIR}/"
BBFILE_PRIORITY_meta-arm =3D "6"

LAYERDEPENDS_meta-arm =3D "core"
-LAYERSERIES_COMPAT_meta-arm =3D "warrior zeus"
+LAYERSERIES_COMPAT_meta-arm =3D "warrior zeus dunfell"
--
2.7.4


--_000_4C6F3AB1F166419D843C7B4F11367C77armcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <71A6F7EA7BCAF047B858805BD12AB197@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 31 Mar 2020, at 20:57, Denys Dmytriyenko via <a href=3D"=
http://Lists.Yoctoproject.Org" class=3D"">
Lists.Yoctoproject.Org</a> &lt;<a href=3D"mailto:denis=3Ddenix.org@lists.yo=
ctoproject.org" class=3D"">denis=3Ddenix.org@lists.yoctoproject.org</a>&gt;=
 wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D"">
<div class=3D"">Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:deny=
s@ti.com" class=3D"">denys@ti.com</a>&gt;<br class=3D"">
</div>
</div>
</blockquote>
<div><br class=3D"">
</div>
<div>Reviewed-by: Bertrand Marquis &lt;<a href=3D"mailto:bertrand.marquis@a=
rm.com" class=3D"">bertrand.marquis@arm.com</a>&gt;</div>
<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">
<div class=3D"">---<br class=3D"">
meta-arm-bsp/conf/layer.conf &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 2 &#43;-=
<br class=3D"">
meta-arm-toolchain/conf/layer.conf | 3 &#43;--<br class=3D"">
meta-arm/conf/layer.conf &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;| 2 &#43;-<br class=3D"">
3 files changed, 3 insertions(&#43;), 4 deletions(-)<br class=3D"">
<br class=3D"">
diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf<br=
 class=3D"">
index 0632ba3..8afcbe5 100644<br class=3D"">
--- a/meta-arm-bsp/conf/layer.conf<br class=3D"">
&#43;&#43;&#43; b/meta-arm-bsp/conf/layer.conf<br class=3D"">
@@ -10,7 &#43;10,7 @@ BBFILE_PATTERN_meta-arm-bsp =3D &quot;^${LAYERDIR}/&q=
uot;<br class=3D"">
BBFILE_PRIORITY_meta-arm-bsp =3D &quot;6&quot;<br class=3D"">
<br class=3D"">
LAYERDEPENDS_meta-arm-bsp =3D &quot;core openembedded-layer meta-arm&quot;<=
br class=3D"">
-LAYERSERIES_COMPAT_meta-arm-bsp =3D &quot;warrior zeus&quot;<br class=3D""=
>
&#43;LAYERSERIES_COMPAT_meta-arm-bsp =3D &quot;warrior zeus dunfell&quot;<b=
r class=3D"">
<br class=3D"">
# We have patches for xen but meta-virtualization might not be there so fil=
ter<br class=3D"">
# out recipes-extended/xen unless xen is activated in the features<br class=
=3D"">
diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/l=
ayer.conf<br class=3D"">
index a247dc1..3a4c4f0 100644<br class=3D"">
--- a/meta-arm-toolchain/conf/layer.conf<br class=3D"">
&#43;&#43;&#43; b/meta-arm-toolchain/conf/layer.conf<br class=3D"">
@@ -8,8 &#43;8,7 @@ BBFILE_COLLECTIONS &#43;=3D &quot;arm-toolchain&quot;<b=
r class=3D"">
BBFILE_PATTERN_arm-toolchain :=3D &quot;^${LAYERDIR}/&quot;<br class=3D"">
BBFILE_PRIORITY_arm-toolchain =3D &quot;30&quot;<br class=3D"">
<br class=3D"">
-LAYERSERIES_COMPAT_arm-toolchain =3D &quot;zeus&quot;<br class=3D"">
&#43;LAYERSERIES_COMPAT_arm-toolchain =3D &quot;zeus dunfell&quot;<br class=
=3D"">
<br class=3D"">
# do not error out on bbappends for missing recipes<br class=3D"">
BB_DANGLINGAPPENDS_WARNONLY =3D &quot;true&quot;<br class=3D"">
-<br class=3D"">
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf<br class=
=3D"">
index 65ccd15..0b93e8d 100644<br class=3D"">
--- a/meta-arm/conf/layer.conf<br class=3D"">
&#43;&#43;&#43; b/meta-arm/conf/layer.conf<br class=3D"">
@@ -10,4 &#43;10,4 @@ BBFILE_PATTERN_meta-arm =3D &quot;^${LAYERDIR}/&quot;=
<br class=3D"">
BBFILE_PRIORITY_meta-arm =3D &quot;6&quot;<br class=3D"">
<br class=3D"">
LAYERDEPENDS_meta-arm =3D &quot;core&quot;<br class=3D"">
-LAYERSERIES_COMPAT_meta-arm =3D &quot;warrior zeus&quot;<br class=3D"">
&#43;LAYERSERIES_COMPAT_meta-arm =3D &quot;warrior zeus dunfell&quot;<br cl=
ass=3D"">
-- <br class=3D"">
2.7.4<br class=3D"">
</div>
</div>
</blockquote>
</div>
<br class=3D"">
</body>
</html>

--_000_4C6F3AB1F166419D843C7B4F11367C77armcom_--
