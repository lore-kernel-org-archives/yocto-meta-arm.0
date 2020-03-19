Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.81])
 by mx.groups.io with SMTP id smtpd.web10.7573.1584604973085053185
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Mar 2020 01:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=RcaE/bnR;
 spf=pass (domain: arm.com, ip: 40.107.6.81, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1g+CYtUK6fGIfCyVazipYOLswD1IStVv3cynpvZZmyU=;
 b=RcaE/bnRZWV+U9UxqmYT6jYQ2f+UeUgJayzoNKc4DBjUxRk81DDxj58CNkmrJcDNbJkVmoWiC1z6fT6e8zeOZ80wqoNHfu7sS7EoLosRegIqaO096IKWQVbVWpyd4ko2Zc7xz5TOyx0TURVaZWzdRJQIt0iElmmUP/E9cVwTdU0=
Received: from DB6PR0201CA0039.eurprd02.prod.outlook.com (2603:10a6:4:3f::49)
 by AM6PR08MB3782.eurprd08.prod.outlook.com (2603:10a6:20b:87::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18; Thu, 19 Mar
 2020 08:02:50 +0000
Received: from DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::28) by DB6PR0201CA0039.outlook.office365.com
 (2603:10a6:4:3f::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.15 via Frontend
 Transport; Thu, 19 Mar 2020 08:02:50 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT064.mail.protection.outlook.com (10.152.21.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Thu, 19 Mar 2020 08:02:50 +0000
Received: ("Tessian outbound 47356f393f3c:v48"); Thu, 19 Mar 2020 08:02:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 130821fd67a2c2f0
X-CR-MTA-TID: 64aa7808
Received: from d08c72901a60.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 26CEFBAD-8AF7-428C-A490-18BDC2439E15.1;
	Thu, 19 Mar 2020 08:02:45 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d08c72901a60.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 19 Mar 2020 08:02:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=El6ZwXZfhHQriK81il3TatrRzlqZ4dSfAYyIY21Ou1T1p+Ptwm3rNY/dM9EC4f0Xjsf0MW/6/mL7bLUBcB+olIJ2ZJU1MlkOE2wnNbb7JVHjIEYQaA9HwfEDPadiPbGdU4QjdbhB9BQVjyaWTZfqqPB/8X0cOcNGW5GNAi6iGXVVBjtRdkIi484hlPBow35PRT2Bt/6WotsMnXQbWUkpBd5h0eZBiojKWExsGQ2zJ8Ve3/uTRbB/rf2+A1qqeey+LdynHhiGfOa+CdIlNCHoUMdR1mhpTo/RIrTfJF7k6jQ7CkT/qnHcYtcxIVlux2On5JJgwaaCvZb5g/ombXnZdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1g+CYtUK6fGIfCyVazipYOLswD1IStVv3cynpvZZmyU=;
 b=TKn3Cgl2er6+mH0ECkB1LpRweT1QKKmNbBZy6r+HoZv0H6k4bFd5R7eWKq6lOnJcI0uC/XgEiRNcp6NDG6wxh0hbdmqGO3yvAPFs8dhWI10kuRUYv35I8tQZd3bd3I1jXjTXRQv+8A1MuKbZX/w0jB9WfKnHfFHoAqqOYtOVNXf91YmixNSyxc1L5iNy99DngcCSRNtKOFMJ03qDRIYwhh7FdOtY5URGaOaoamn83PCW0+RPUckU0YSyCNdvVkpRYtSgycBmvJEwr10S34DrW1N7RrZqioAHISNIel+J77GgFnKm9/yeufuL0UXAlTrrSSzH5SJDixxXBmovMd819Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1g+CYtUK6fGIfCyVazipYOLswD1IStVv3cynpvZZmyU=;
 b=RcaE/bnRZWV+U9UxqmYT6jYQ2f+UeUgJayzoNKc4DBjUxRk81DDxj58CNkmrJcDNbJkVmoWiC1z6fT6e8zeOZ80wqoNHfu7sS7EoLosRegIqaO096IKWQVbVWpyd4ko2Zc7xz5TOyx0TURVaZWzdRJQIt0iElmmUP/E9cVwTdU0=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3274.eurprd08.prod.outlook.com (52.134.111.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.18; Thu, 19 Mar 2020 08:02:43 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2835.017; Thu, 19 Mar 2020
 08:02:43 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] foundation: disable Scalable Vector Extension (SVE)
Thread-Topic: [meta-arm] [PATCH] foundation: disable Scalable Vector Extension
 (SVE)
Thread-Index: AQHV/R0aBwoo+dTvD0q5dJeyCjtUCqhPj06A
Date: Thu, 19 Mar 2020 08:02:43 +0000
Message-ID: <6540BF0E-DAF6-4BEE-AA99-AC6FBE4D96AE@arm.com>
References: <20200318120146.24154-1-rahul.singh@arm.com>
In-Reply-To: <20200318120146.24154-1-rahul.singh@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: df07bf73-1e6d-446d-62c0-08d7cbdbeb75
x-ms-traffictypediagnostic: DB7PR08MB3274:|AM6PR08MB3782:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB378231161632C0D2568704449DF40@AM6PR08MB3782.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 0347410860
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(199004)(6512007)(316002)(8936002)(86362001)(6506007)(6486002)(33656002)(53546011)(81166006)(81156014)(478600001)(8676002)(4326008)(66946007)(71200400001)(66446008)(186003)(66556008)(64756008)(36756003)(76116006)(66476007)(91956017)(2906002)(26005)(6916009)(2616005)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR08MB3274;H:DB7PR08MB3689.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 8SEZUwyW0wwQ1QdY9NIbddcrIDROQ5AHL7HxqO0vEdyIPPYZB+YgpNFxVkI4CCxW+jagSqhorMKWK8oiVMtJ/+4QMPcXTrVNlI2B31fibLyYzV1I9QLzcaRTsJAIyyFK3sHNl+8xo28pfLsdBwiUHsu+zTwryN39AiphVB4XnmE+HE8zgA0uWH2k7miblnFbFiczLsNStpUbEdyS8TmwfwjSz0pHMvOb6yOAiWI6+Zvamdh2fuWetZDFdcawUyXWxljnvwWBpxHLROdbkLtBI/gUNuopKwxVDcsiD0gwd36J2JJwmxZ+8GpbVVR9fFee5VSjsR2XE8lYd8vFLdHnsgBLEtfTzNFFwYSZAYV0IZIMBYAytwu/MnrS58Yt92dJuKyAraZUTrBW7muNVTo8iR6PTySQzF8Wok0avAErD8T0OeyJncu67cwzYXBfckIC3lUs3zDssmGHp8XDptH6HaYMm0ZjKXmCaZHeRBA1HayxvxKnDgSGgnv4d/roslbsPLhk+mUsHi34czIUqJRwlg==
x-ms-exchange-antispam-messagedata: 
 otc4eMojxIdSRrO+V+LB0UbQD2AwxVhFFCrXZxfEsJUHKmY9lkk/WEW2lVSE7ava9MbkaAzgb+vT/D1/2OqhGaEGEnnpoKX84EIb1H15uaTwC652ZCkV6UDe1hh5omgPEJ65wRv8SGfWasIg1fFf7A==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3274
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(39860400002)(199004)(46966005)(47076004)(2906002)(36756003)(8676002)(8936002)(81156014)(70586007)(81166006)(2616005)(336012)(26005)(70206006)(5660300002)(186003)(6506007)(316002)(4326008)(53546011)(356004)(26826003)(33656002)(6512007)(86362001)(478600001)(6486002)(45080400002)(6916009);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR08MB3782;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	90ae9b76-8820-4e82-6010-08d7cbdbe76f
X-Forefront-PRVS: 0347410860
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cOpLQTIuLNHdlmkSMWqD3finus9OLAwns9csmhA8O9ZKuCVoG3b5/Y/ou2i+EL2QTMbIbaVgdF9zw4xkjrq39aM3asrTxW7r1QzyMopDI7Z7MjzCbNYOykz+Nf+97Jx7T1CBDgZfvCbuLpi+GYbMhqwS1jPt42tpe/l4NLam7JDB+9s7yyOpRwv4jj4tiFWaC/+CUO2VN6EzhRsBIPMZ5/Au/+RNMXPJ2e/kJ++CTjyP4hv9QSgY27s7pRtAbO9bsqQBMMG4XmHro3oxSmdSW3wsnDkM4/Lni7/szAC3wyuk3DNeSVZS0Xz3qJ+9KuB/PrKqXd2hF3ooFJTyEJ6QKRtywt6MO6yD40xezlWfMc0r5z65SoObSG3EM4b/UowYVlq8kmoawJx5h7pPqFf7nILSOz8MTbCog8hG75mkilFQHH2k0Gk54tuD3WsUqX+7uZtKvLsOlbzCACpQf4KFrp578hQ7zzH/WI6uPyRdLTexFHtga4pV3iFdxQnVY0WtB7X241fz6MnYL35DOVlsPwBoNy+rX1J1vMriQcpFhOI2P5vB74DrpFYvgAfuWxSHsOriGuBnJHO+sO1wQfJUFA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2020 08:02:50.4759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df07bf73-1e6d-446d-62c0-08d7cbdbeb75
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3782
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_6540BF0EDAF64BEEAA99AC6FBE4D96AEarmcom_"

--_000_6540BF0EDAF64BEEAA99AC6FBE4D96AEarmcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 18 Mar 2020, at 12:01, Rahul Singh via Lists.Yoctoproject.Org<http://Lis=
ts.Yoctoproject.Org> <rahul.singh=3Darm.com@lists.yoctoproject.org<mailto:r=
ahul.singh=3Darm.com@lists.yoctoproject.org>> wrote:

When foundation platform is booted with SVE enabled in linux
kernel and with Xen hypervisor, linux kernel is stopped by a
trap catched by Xen during early boot as Xen is configuring
the coprocessor to trap access to SVE to EL2.Disabling the SVE
in foundation to boot the guest and host.

Change-Id: I862540a46686f1fb5343a3143da61db6073bb1d3
Signed-off-by: Rahul Singh <rahul.singh@arm.com<mailto:rahul.singh@arm.com>=
>
---
.../recipes-devtools/fvp-common/files/start-foundation-armv8.sh | 2 ++
1 file changed, 2 insertions(+)

diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundatio=
n-armv8.sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundatio=
n-armv8.sh
index 1df4fd8..e014124 100755
--- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8=
.sh
+++ b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8=
.sh
@@ -41,9 +41,11 @@ FOUNDATION_PLAT_EXE=3D"Foundation_Platform"

# Foundation Platform arguments
# 4 cores
+# Disable Scalable Vector Extension (SVE)
# gicv3 emulation (required for hardware virtualisation)
FOUNDATION_PLAT_ARGS=3D" \
    --cores=3D4 \
+    --no-sve \
    --gicv3"

# Foundation Platform user arguments
--
2.17.1


Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com<mailto:bertrand.mar=
quis@arm.com>>


--_000_6540BF0EDAF64BEEAA99AC6FBE4D96AEarmcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <0AF8B63A5CDCCA42BA520400D434DA2A@eurprd08.prod.outlook.com>
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
<div class=3D"">On 18 Mar 2020, at 12:01, Rahul Singh via <a href=3D"http:/=
/Lists.Yoctoproject.Org" class=3D"">
Lists.Yoctoproject.Org</a> &lt;<a href=3D"mailto:rahul.singh=3Darm.com@list=
s.yoctoproject.org" class=3D"">rahul.singh=3Darm.com@lists.yoctoproject.org=
</a>&gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D"">
<div class=3D"">When foundation platform is booted with SVE enabled in linu=
x<br class=3D"">
kernel and with Xen hypervisor, linux kernel is stopped by a<br class=3D"">
trap catched by Xen during early boot as Xen is configuring<br class=3D"">
the coprocessor to trap access to SVE to EL2.Disabling the SVE<br class=3D"=
">
in foundation to boot the guest and host.<br class=3D"">
<br class=3D"">
Change-Id: I862540a46686f1fb5343a3143da61db6073bb1d3<br class=3D"">
Signed-off-by: Rahul Singh &lt;<a href=3D"mailto:rahul.singh@arm.com" class=
=3D"">rahul.singh@arm.com</a>&gt;<br class=3D"">
---<br class=3D"">
.../recipes-devtools/fvp-common/files/start-foundation-armv8.sh | 2 &#43;&#=
43;<br class=3D"">
1 file changed, 2 insertions(&#43;)<br class=3D"">
<br class=3D"">
diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundatio=
n-armv8.sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundatio=
n-armv8.sh<br class=3D"">
index 1df4fd8..e014124 100755<br class=3D"">
--- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8=
.sh<br class=3D"">
&#43;&#43;&#43; b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foun=
dation-armv8.sh<br class=3D"">
@@ -41,9 &#43;41,11 @@ FOUNDATION_PLAT_EXE=3D&quot;Foundation_Platform&quot=
;<br class=3D"">
<br class=3D"">
# Foundation Platform arguments<br class=3D"">
# 4 cores<br class=3D"">
&#43;# Disable Scalable Vector Extension (SVE)<br class=3D"">
# gicv3 emulation (required for hardware virtualisation)<br class=3D"">
FOUNDATION_PLAT_ARGS=3D&quot; \<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;--cores=3D4 \<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;--no-sve \<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;--gicv3&quot;<br class=3D"">
<br class=3D"">
# Foundation Platform user arguments<br class=3D"">
-- <br class=3D"">
2.17.1<br class=3D"">
<br class=3D"">
</div>
</div>
</blockquote>
<div><br class=3D"">
</div>
<div>Reviewed-by: Bertrand Marquis &lt;<a href=3D"mailto:bertrand.marquis@a=
rm.com" class=3D"">bertrand.marquis@arm.com</a>&gt;</div>
</div>
<br class=3D"">
</body>
</html>

--_000_6540BF0EDAF64BEEAA99AC6FBE4D96AEarmcom_--
