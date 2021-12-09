Return-Path: <hugo.lhostis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6824C433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 11:32:53 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.43])
 by mx.groups.io with SMTP id smtpd.web12.10176.1639049572125995018
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 03:32:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=ZCNhh5cY;
 spf=pass (domain: arm.com, ip: 40.107.7.43, mailfrom: hugo.lhostis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSJ+NOR+C3JNLT2XM391SJMS/Pl4eeO32hMugUhvRAQ=;
 b=ZCNhh5cYibAVmAbI9zulVL3Xje4OlOSBlbc1v/6tIyrF3PJA3QxgA+WND7vL6laOo3fVo+T8FVoxUp8oUqxm5JV/ojEwVSeW5ZaMl5lO1S49YIK5ipDDzk70AI+behbVXPdeI9jvW90XWoobu9y9HmBFKhA1yXTsCFZBFyGPcbY=
Received: from AM5PR0601CA0055.eurprd06.prod.outlook.com (2603:10a6:206::20)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Thu, 9 Dec
 2021 11:32:47 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::4) by AM5PR0601CA0055.outlook.office365.com
 (2603:10a6:206::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Thu, 9 Dec 2021 11:32:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.12 via Frontend Transport; Thu, 9 Dec 2021 11:32:47 +0000
Received: ("Tessian outbound c61f076cbd30:v110");
 Thu, 09 Dec 2021 11:32:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 073a4c80d48c656d
X-CR-MTA-TID: 64aa7808
Received: from 9731cad5e10d.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 22CC9117-5E14-4169-8CFE-12E2FA516351.1;
	Thu, 09 Dec 2021 11:32:30 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 9731cad5e10d.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 09 Dec 2021 11:32:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDaglNJzegHS2dE7krql7e0nuVfkPzOb1ETFMjlb6HIfj0dLD2a3jIfp1sUGo7gmuJ31Mh7FxiEbTdc8Tz2f6z3REbNtpH0iD5W3wwj+hZGYYIikDfiPd5wefslg+UtJmtreu3QiPIYFZl9VmJbT/8wH7ChlS6pzkdc6cblPqp7fmxo7F8N75gev7gSCGg6Hto695xR4P7XEpyKofLff93imKs9uKnWQmeVQJR5bP47Lt4mQxVRbc30eQWtf2uyynAChrChM2AScuWiHTrik/1OAJCyx+z4GanUmDRblz0jGeOMHiVvYoIVQ32elGT27Dr+QP13T/Nfv4bSqpd5b8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSJ+NOR+C3JNLT2XM391SJMS/Pl4eeO32hMugUhvRAQ=;
 b=nDV1BQWTsqGIS4s8buhDq3e0jkuNvRPeGuPL4pT1/DuKIH/3kcLIf7GJEGC3/6lbtSu//4nQTVh7udefHoZDoQGkouJpMHIdVxsehphiX6DVmSUlgG6ChG4wNEnnTIcQxTS/6T2S6RwvLK0E0B09gkPeDgrCu5m06AT3etdD4nXEFXEvstELyLUziBTSdQsqbACdfLSpgJu6qEU4tM4mMo6fzWjraRZVfKL8PGsBM0Eepqm7ePhrl8QczogZSXDLT0+AzdTB+F0iyLJ/jfWt+6tA97enGl9nd4v1Tnz7+IDYpvLNvHh0FaKn68y37oeRxrHXb34ohvjLg2DFTbdMdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSJ+NOR+C3JNLT2XM391SJMS/Pl4eeO32hMugUhvRAQ=;
 b=ZCNhh5cYibAVmAbI9zulVL3Xje4OlOSBlbc1v/6tIyrF3PJA3QxgA+WND7vL6laOo3fVo+T8FVoxUp8oUqxm5JV/ojEwVSeW5ZaMl5lO1S49YIK5ipDDzk70AI+behbVXPdeI9jvW90XWoobu9y9HmBFKhA1yXTsCFZBFyGPcbY=
Received: from DBAPR08MB5560.eurprd08.prod.outlook.com (2603:10a6:10:1ac::23)
 by DB8PR08MB4570.eurprd08.prod.outlook.com (2603:10a6:10:ae::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Thu, 9 Dec
 2021 11:32:24 +0000
Received: from DBAPR08MB5560.eurprd08.prod.outlook.com
 ([fe80::1503:f149:3610:d540]) by DBAPR08MB5560.eurprd08.prod.outlook.com
 ([fe80::1503:f149:3610:d540%6]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 11:32:24 +0000
From: Hugo L'hostis <Hugo.Lhostis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Hugo
 L'hostis <Hugo.Lhostis@arm.com>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] kas: Update include syntax to kas 2.6
Thread-Topic: [meta-arm] [PATCH] kas: Update include syntax to kas 2.6
Thread-Index: AQHX7OKKrcJrRhiaYk2t643ukwHbuKwqBt9w
Date: Thu, 9 Dec 2021 11:32:24 +0000
Message-ID: 
 <DBAPR08MB5560CF14ADBFBBC5053C0F3586709@DBAPR08MB5560.eurprd08.prod.outlook.com>
References: <16BF0C7931AA05CD.7398@lists.yoctoproject.org>
In-Reply-To: <16BF0C7931AA05CD.7398@lists.yoctoproject.org>
Accept-Language: en-GB, fr-FR, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 67c1352b-14fa-5d81-0a3d-4aa8f12180b8
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: fc7b8c13-202d-4e95-7166-08d9bb079fe0
x-ms-traffictypediagnostic: 
	DB8PR08MB4570:EE_|VE1EUR03FT009:EE_|AM5PR0801MB1972:EE_
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB197213887C6CD16AB3E777E986709@AM5PR0801MB1972.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 m13RA/c1r8j3zgH9nVWoqCbxjtv4to6jta77USQaZDAVLDThTdG2Z+CUh2cw7CEyl7aNaon2UZlSuQukoW1FP0e8apzZkqckREhTB7e1XP/DQr2uEYz1bzVpBQxmH+mrFYNd+bQhfk757euiw6//Kls177swVVb6Zt+d4gx3GMAAmXort2mrFKLMcqiTgSHoSO+xXKmfUsPgtyIpgXQxvUr1RN1pr51joQLM6F2+/FpHNt7VOka52qUFxjtemF18TONEHp3yG7Qa89IS4sfHhbjASB9ieJZRlnGIRsC7kNZYPkQ9EJRCw2T9eTXVsqpRd8GgLsfr1xnaLwKh/nKATw6V1aB58dajM3EcMWoR+sxrLF2tjFq1NgIttYWdwMBqqPLKGXR7kbuf8CJTqCtwTWaPhFJhRFD2pjRnAFuQn3Mks74pvSzunZvCxk2LsP5wpfPBMpo1U9oHvS83xNzE4konta5D0LUk+x3LTVXnzGrmFtMeWijiaufeLeKG5UmkBuzpj0+J5tUT72Aq9zNR+wdWR5snx/zbpzXbSp4Byjr2Y8fNMrk0a1xQ/XidH8BmJ5m8cRbrQsdOh6iPWfEv/tjE1HwzlsoqbpZLX03rTQJvjccnyPqqbVfYcby6m0DDJgbjO+6YmxIF+Gnz2QELkp0e7Wg7o/4ifSgmFBEtwKoTeOOQ4uDqkvndMc++iHMKHYuFbwmIu+CW0jz/i3zPll/5CO/2B9WSEZSN6l/1RngFUztD0as3qvC/rzFcLX6puy7uetIMdwWdGcpxoE91Y0CBYn5qdlIiI4nbeg569Lo=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5560.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(76116006)(33656002)(38100700002)(71200400001)(166002)(2906002)(19627405001)(186003)(15650500001)(8676002)(86362001)(66476007)(64756008)(83380400001)(52536014)(4326008)(966005)(66946007)(38070700005)(110136005)(316002)(5660300002)(9686003)(66556008)(122000001)(508600001)(7696005)(26005)(91956017)(55016003)(6506007)(66446008);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_DBAPR08MB5560CF14ADBFBBC5053C0F3586709DBAPR08MB5560eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4570
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	24b24520-24c7-47a7-9711-08d9bb079261
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GGkMpwfa/eLB6wQdib0CR9EtWHmnNe9YO/t3KktXaWQ4U4TeAr1XgKIZPS6ILFbtnsfqChYefryaAKr232gKquaLaIbkw+UYrw6m+yF2VGxLS1TL8beMJ0OWScUGZ0fOLdIxYfTl8jVDoAvTUqfrYcXKGwfs0AsCyfp4r6qmkztPHAIPEzlbp5ULWpgxfnCQzMSa9oycZXW20LsvAjR7nlsjCo785XyQwgWqE7WRh5t/48h1YgfI1isS63rccVLpDR03PaZ6pdLbk6XaTSXAgQdyl7kJ24iln3UV+kVzughotGzAkCVhbOh78W9DBz4bQEe+sO+3TAog+1LLrJ+S52U7uFHelNxz59BO9hP4ffVG709kgi8HaSzUOIMwfs8JGuD/py41SlaArxVxgZikTHOEqmBXfUQ2ajJnV02kV7JjZ4GBO/YeDOFQ+eLxKpMk0HqRrt1pEeDs4Pv0inLiNqlCv3/CpTMLncUczvZ9byhLy5PjUc8ChvbU5DRblJ1ddkOAuo1Jb4/+OUCmtEo9TCH6OfEXP6g/7dDBXzNcjOlK4NWzoAC0eLXuVV88oRE4Nctu6cKYZpFK/rzC85dme4wOrQa5paGgM4iJmJL4jDM2RLfcqIfa3PS1ljHHhpdQ1kabYVwr6QmR+ry4OOdC/q67bjiTohFX7BedDSnTUWu6BGxJmnZXPdtmXrML3WqqJduE6lyT4WrxlG0kHRMAoldMNKf1QnYVLyuqLMD6ddOzCDlKqIMOR2SIo7pSe1KLQ5ATpk9W2B+aVpe+5VO6SXarDPlchyg/OltleDjicsbUc6d1A+gCKKsN/1TqtMXGU4+mh1TfuL/uESoa/E5VZPFSQYWWZNGL4T2xH74Dd10=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700001)(36860700001)(4326008)(7696005)(55016003)(8676002)(82310400004)(8936002)(70206006)(70586007)(186003)(52536014)(26005)(47076005)(33656002)(336012)(19627405001)(6506007)(356005)(2906002)(110136005)(83380400001)(81166007)(508600001)(15650500001)(316002)(9686003)(86362001)(166002)(966005)(5660300002)(40460700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 11:32:47.0039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fc7b8c13-202d-4e95-7166-08d9bb079fe0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1972
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Dec 2021 11:32:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2574

--_000_DBAPR08MB5560CF14ADBFBBC5053C0F3586709DBAPR08MB5560eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Can this patch also be backported on honister please ?

Thanks,

Hugo
________________________________
From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on =
behalf of Hugo L'Hostis via lists.yoctoproject.org <hugo.lhostis=3Darm.com@=
lists.yoctoproject.org>
Sent: 09 December 2021 09:34
To: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
Cc: nd <nd@arm.com>
Subject: [meta-arm] [PATCH] kas: Update include syntax to kas 2.6

Using a path relative to a kas yaml file to include another kas yaml
file won't be supported in the future. This patch also updates the
documentation for fvp-baser to set the minimal supported version of kas
to 2.6.

Signed-off-by: Hugo L'Hostis <hugo.lhostis@arm.com>
Change-Id: I757103c5433bca7af9ab024370cd1e994d59fe0e
---
 kas/fvp-baser-aemv8r64-rt-bsp.yml                | 2 +-
 meta-arm-bsp/documentation/fvp-baser-aemv8r64.md | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/kas/fvp-baser-aemv8r64-rt-bsp.yml b/kas/fvp-baser-aemv8r64-rt-=
bsp.yml
index 69335e3..19ee747 100644
--- a/kas/fvp-baser-aemv8r64-rt-bsp.yml
+++ b/kas/fvp-baser-aemv8r64-rt-bsp.yml
@@ -1,7 +1,7 @@
 header:
   version: 9
   includes:
-    - fvp-baser-aemv8r64-bsp.yml
+    - kas/fvp-baser-aemv8r64-bsp.yml

 local_conf_header:
   base-rt: |
diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-bs=
p/documentation/fvp-baser-aemv8r64.md
index 0c801c0..fdf5038 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -44,7 +44,8 @@ Ubuntu 20.04.
 Install the required packages for the build host:
 https://docs.yoctoproject.org/singleindex.html#required-packages-for-the-b=
uild-host

-Install the kas setup tool for bitbake based projects:
+Kas is a setup tool for bitbake based projects. The minimal supported vers=
ion
+is 2.6, install it like so:

     pip3 install --user kas

--
2.25.1


--_000_DBAPR08MB5560CF14ADBFBBC5053C0F3586709DBAPR08MB5560eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hello,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Can this patch also be backported on honister please ?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hugo<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> meta-arm@lists.yoctop=
roject.org &lt;meta-arm@lists.yoctoproject.org&gt; on behalf of Hugo L'Host=
is via lists.yoctoproject.org &lt;hugo.lhostis=3Darm.com@lists.yoctoproject=
.org&gt;<br>
<b>Sent:</b> 09 December 2021 09:34<br>
<b>To:</b> meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.=
org&gt;<br>
<b>Cc:</b> nd &lt;nd@arm.com&gt;<br>
<b>Subject:</b> [meta-arm] [PATCH] kas: Update include syntax to kas 2.6</f=
ont>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Using a path relative to a kas yaml file to includ=
e another kas yaml<br>
file won't be supported in the future. This patch also updates the<br>
documentation for fvp-baser to set the minimal supported version of kas<br>
to 2.6.<br>
<br>
Signed-off-by: Hugo L'Hostis &lt;hugo.lhostis@arm.com&gt;<br>
Change-Id: I757103c5433bca7af9ab024370cd1e994d59fe0e<br>
---<br>
&nbsp;kas/fvp-baser-aemv8r64-rt-bsp.yml&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 +-<br>
&nbsp;meta-arm-bsp/documentation/fvp-baser-aemv8r64.md | 3 ++-<br>
&nbsp;2 files changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/kas/fvp-baser-aemv8r64-rt-bsp.yml b/kas/fvp-baser-aemv8r64-rt-=
bsp.yml<br>
index 69335e3..19ee747 100644<br>
--- a/kas/fvp-baser-aemv8r64-rt-bsp.yml<br>
+++ b/kas/fvp-baser-aemv8r64-rt-bsp.yml<br>
@@ -1,7 +1,7 @@<br>
&nbsp;header:<br>
&nbsp;&nbsp; version: 9<br>
&nbsp;&nbsp; includes:<br>
-&nbsp;&nbsp;&nbsp; - fvp-baser-aemv8r64-bsp.yml<br>
+&nbsp;&nbsp;&nbsp; - kas/fvp-baser-aemv8r64-bsp.yml<br>
&nbsp;<br>
&nbsp;local_conf_header:<br>
&nbsp;&nbsp; base-rt: |<br>
diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-bs=
p/documentation/fvp-baser-aemv8r64.md<br>
index 0c801c0..fdf5038 100644<br>
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md<br>
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md<br>
@@ -44,7 +44,8 @@ Ubuntu 20.04.<br>
&nbsp;Install the required packages for the build host:<br>
&nbsp;<a href=3D"https://docs.yoctoproject.org/singleindex.html#required-pa=
ckages-for-the-build-host">https://docs.yoctoproject.org/singleindex.html#r=
equired-packages-for-the-build-host</a><br>
&nbsp;<br>
-Install the kas setup tool for bitbake based projects:<br>
+Kas is a setup tool for bitbake based projects. The minimal supported vers=
ion<br>
+is 2.6, install it like so:<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; pip3 install --user kas<br>
&nbsp;<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DBAPR08MB5560CF14ADBFBBC5053C0F3586709DBAPR08MB5560eurp_--

