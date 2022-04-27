Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91459C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 16:31:03 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.82])
 by mx.groups.io with SMTP id smtpd.web12.10671.1651077054930634670
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 09:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=sDMa1czZ;
 spf=pass (domain: arm.com, ip: 40.107.8.82, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ayF0tx8blxOSr+M682lQg4eMzUGvGB0bwdIadTUhUyCB6MUQUBtSqZ2ey5Pepc0AxqfT6lnZ9AXiUjdbSCm834NanvbVam+C65Lnjn550ci2CN6vqqM3FGxhhbZwDSCyGPPiWKuOdlg3DiRo3jK14st27zql4oOzIIIYeYAYXVXF4DdDthuGV9JfvNoPHBwLiEfsR6u1bkwPx9Kn6u1SaRG6vNhyZvUQNZhDoBKv9BQdBfi1k4vke4NYO2XK+E9i0g0DtkrCBuVR0WGzdwEwapOdOHLyJjqA0mjZqmE7h8iAc8KsE4dBhQpAfhqb62uiH85t6PbvdbIvqoztkfMNIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMJNYfUnz2JV9WqoYcLquQhXKas1mrR+Jfxe93rcjHk=;
 b=gvQQrSoo9tmuxclfF6ilSEk8kSpy8gPL4UYILbrIKCqdfCOzaW6Rayk/aZ+F4F2F70Q8i9WrilXBnQ5PqnswLTp8uBEkbncE/e65ZYiJXWtAO9NQR8tbhu1eBojUxwOL+23eVDKuJDqsMTpYyFFtb59T4eIVQHBpiPFdklo7CzVElgi/E9/GRcm1jqegC/I0GbBqPgNK1qNOrQ6t4uoTcFSszXMXeqfTJO4R6ssJiEi8VfkUfH9b7soEBf10NOGOz/dAc6EIJagtEKt9sm0MZwguql+Xl2kIHmKUniYPliVfE8lf06wilrUNaL6Ief0jKenw8oSiSN3siIR/31wJLg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMJNYfUnz2JV9WqoYcLquQhXKas1mrR+Jfxe93rcjHk=;
 b=sDMa1czZNLg371yvXryyaIH+0Oe+5qFTYCXKo5dyAKyrIRzlRB21mlij1n7olK0O+I74EyjSZNuedT6I+NgzwDNwDJUTPoUMknmIp5jH3/lzxEYCwFXanMdEmp9824ciRSFwCIt1ou8pFL535lTRBA9WZS25ZO06soQoU7YKW8w=
Received: from AM6P195CA0026.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::39)
 by AM9PR08MB6867.eurprd08.prod.outlook.com (2603:10a6:20b:305::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 27 Apr
 2022 16:30:50 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::73) by AM6P195CA0026.outlook.office365.com
 (2603:10a6:209:81::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Wed, 27 Apr 2022 16:30:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 16:30:49 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Wed, 27 Apr 2022 16:30:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f900e11ac0efb12e
X-CR-MTA-TID: 64aa7808
Received: from 0ad7082de07b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 96632DE6-1D18-48D9-9E16-85DDE6B15FD3.1;
	Wed, 27 Apr 2022 16:30:42 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 0ad7082de07b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 27 Apr 2022 16:30:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORmQYGKViu552gYneT+KWYxiMwUt89n5Dwnr61JHe0lYPKdDwwhm1pwsussBKgEVUCWFknOe4lIrHgvH9PoqTjpjx9LrkGJyrEdsHFWRfJ2en51JFFyDRVmY80chmhjylnRg8w3j4PWwdqvyyvdOwxQfiE+gyZX91dRV5JPZEMPgHPH3/P7ClOQRNsGBmRzBLNrBLSi9k3rYu7OxmQkYUw263LOqxsB4pwaLLB+PR8fj2CWI3vg5NHAqXzb1Ii8G8Q4t6wvJpR8sB32e1u5C0iDWqyo51AyV8k77O6LHxWrOZxc0oOyl/zdl2bkkop4Ma/8ceWj03gZZVlVq6SY8Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMJNYfUnz2JV9WqoYcLquQhXKas1mrR+Jfxe93rcjHk=;
 b=nj1PYk0GvqZeRW2hlx/Hxw7UMA32TwkvuY9d3jrU2m7rMmtIQhXuZa3gFAVYrzeBGt64x5EnSvHbIY3IPO4Rbar59jvCyEKWDzOKBfgix91szAQaDByRRZi/pzuNTiYMHFpy4/tyOSkbj/RbjE9R/PO2aH2YoKbgYdYZhkoFmU1klEZ+ZYsl9XcByQv/VwQ+PRQgAWXJZgU5Rftm5J7y/MTbxWwbViAY+SlOUa2+Tf4b7Of2ENkn28cEeHHLA4ERZ+LXtyYo+TOPyVib3Lm1TtWsWgZs76gc0R6oxBogTdkRBeSww8uZFOwqA4k3VRzsgV5IRsPk1ENjYU4HGM8i/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMJNYfUnz2JV9WqoYcLquQhXKas1mrR+Jfxe93rcjHk=;
 b=sDMa1czZNLg371yvXryyaIH+0Oe+5qFTYCXKo5dyAKyrIRzlRB21mlij1n7olK0O+I74EyjSZNuedT6I+NgzwDNwDJUTPoUMknmIp5jH3/lzxEYCwFXanMdEmp9824ciRSFwCIt1ou8pFL535lTRBA9WZS25ZO06soQoU7YKW8w=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR08MB2862.eurprd08.prod.outlook.com (2603:10a6:802:22::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 27 Apr
 2022 16:30:40 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::8af:d35b:6628:5013]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::8af:d35b:6628:5013%5]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 16:30:40 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] CI: use kirkstone branch, not master
Thread-Topic: [meta-arm] [PATCH] CI: use kirkstone branch, not master
Thread-Index: AQHYWX5TA7UZaDgNXEWn1cMV7rSe7K0D9TxP
Date: Wed, 27 Apr 2022 16:30:40 +0000
Message-ID: 
 <PA4PR08MB7411E05891C6F07ED91865A7E8FA9@PA4PR08MB7411.eurprd08.prod.outlook.com>
References: <16E97A47A145AE8E.14553@lists.yoctoproject.org>
In-Reply-To: <16E97A47A145AE8E.14553@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 114deeb8-f655-47ca-0666-08da286b4a62
x-ms-traffictypediagnostic: 
	VI1PR08MB2862:EE_|VE1EUR03FT010:EE_|AM9PR08MB6867:EE_
X-Microsoft-Antispam-PRVS: 
	<AM9PR08MB6867AA2099346E1A098758EFE8FA9@AM9PR08MB6867.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 X9u+vcbqfXtwA1GBO2+8e7nlv62qk3k9i/TQOFLCZk9Buj8KMN54W+9niBRSrmBJruqKZ8yLO7Uf8TFApfxg1VjIPmXI1Sx8FMgoRxHJ8pNNvjViNHwj3ejGZ36AyAVskieabVaNVseZkuoPaxjigvICJqB+OGKVJtmmd5JtuycwxCdve2gjEnAVfQsAYwfWdTU/c/vncjDKbwsTpcaEqsIuxz8wrz5XmtT+wiZKSt2E7l7mBWtJNv5MVmbGYESNLrh/JwNJD4mVPLoKG0H2ySFZAw4JBBOQOYBHUtrzhtEjlj7fzCdppBU+JdC9h0vqkPyXD0u0k3B1JOyDqfJR49S4uQ2qgaX6Zdm6BIvIqjQN0cBd3BQWPUWn+z3Q2f+VyWTM6/BeQnM6ArMnmMngSpWnhnNON169lI1WOHaY3rNBq1TyO8n7HWNAwOTrgxf7wmKIylzCMl9rNkjKw05RecW5MnZ593qmCo0IWBLSabH9t3ZKp1hlCGXjVz/CqvNaNFCtbKPhoIZNOhl/LDYn0I/XWVEniEuCV9V44eZOrW29GImGs4Z2eEwJgAJj2lMy/lKTde/hs36IGiFnStvzs8S1oex5SsG9C4HjwVbX8NZXoPyzjPRrIrwyQ/YtY92xe93hMGrPOpCNKY1ifDoE9PAcpnevWYApoi/uzYSXEvpMonrrnYg8rYA//CxCLfNdFJq8FYvvJ8ml4kXNEVVJtDq/RPKprP1FCEeezZR0Mc425S227owgkqxtEtX7tdC+ytW3xyLTpAe5KEJ0ncei+k9dfANKh4REXrtOxr/3qARn3BhbNjLDonIiRQRfUKr+Zv4/igue+c45A6egbIfmOXIkf8Yrt0dAogHFxuL9zrYcM480G9A56RFnNTqB2E0O
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(76116006)(66556008)(316002)(33656002)(66946007)(5660300002)(7696005)(186003)(91956017)(55016003)(2906002)(66476007)(64756008)(8676002)(66446008)(52536014)(8936002)(6916009)(83380400001)(86362001)(166002)(71200400001)(966005)(508600001)(38100700002)(38070700005)(26005)(9686003)(122000001)(6506007);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_PA4PR08MB7411E05891C6F07ED91865A7E8FA9PA4PR08MB7411eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2862
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e447fdfe-4cf2-4d35-9fc2-08da286b4478
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZIZaOo1r9xZDdPXKMBpkDiM0p6q/Td0Z+Ssy2AoaaVB05KDIGSbR8OTMbJRWK9QX+ovn95WaepYLfdd+XtjPIT+Lo98UpoX/817SjgCuOskGzaKxVZKNHAKnyTTCrCVJepeLEyfZ7Hk/aHqjVBCV0g6GFoBgsILJxI5T/r4yH+A8iOo5AJrDE00N1nzdrHNAslyQk0DyIrr95VzucCs4zOI6PQ+gMuaaunwtmimTCO1wfkx7TxAl4GDgWP7iBF2iK/9vLFqBr+dmSE25nUU17fBziucI8fbg+EYmNHGqXfgHDLI5xs1mPYOWXGxcCYbTv0jwamE5g7A7Ubq2NSVe0IEvTptjAwpYhG17CEfcM376KocjS18+hLos+63kIwZ1VS7HVSr+6IVdRPUn2YaEDRr2iY6ImZ7n8b7EUDtlbT4BchjC0L5ikkRQjHX5jbTbJaSthcwxL/BdSYrTX/etMhSC6AaTY3JsQ0jaH/rwPdsIVMGH11mfb3N85OG2AhTWVuuZRNtlaJaxVauTjr7SjD3YoLrhqTmGfCgsPedzYkptPFTIXB31PIBM3+uRgJPGZlXyy/ft7yyvjVTUyWHHep3DAB8B8WP57+JrwxokaKJcSnSQl0E1y4si97Hy/5tDrl6mHjs1hWfgPhKXFzb7CkQ7eOneAvfCsDxakCnD/aEGuYWLtGjCiPHOUP35gk69iAndpSA4YbEG6jbzEhUjT1A6hySPXoqMzTUEqBpb3a8xmFtOjAXAH0JQ0kR0/Bx5KYP8ANGgKVyUg1Mp8eKCmbQl8MlovHk2IkNVvebQImE=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(47076005)(82310400005)(33656002)(336012)(86362001)(83380400001)(8936002)(9686003)(26005)(6506007)(2906002)(5660300002)(52536014)(70586007)(70206006)(8676002)(36860700001)(186003)(166002)(6916009)(508600001)(55016003)(966005)(356005)(81166007)(40460700003)(7696005)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 16:30:49.9490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 114deeb8-f655-47ca-0666-08da286b4a62
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6867
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Apr 2022 16:31:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3312

--_000_PA4PR08MB7411E05891C6F07ED91865A7E8FA9PA4PR08MB7411eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This is now out of date, v2 incoming.

Ross

From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on =
behalf of Ross Burton via lists.yoctoproject.org <ross.burton=3Darm.com@lis=
ts.yoctoproject.org>
Date: Tuesday, 26 April 2022 at 16:00
To: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
Subject: [meta-arm] [PATCH] CI: use kirkstone branch, not master
Until we have released and branched meta-arm we're tracking kirkstone, not
master.  oe-core has branched and master is changing fast, so switch
the default branch now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml                | 2 +-
 ci/clang.yml               | 1 +
 ci/meta-openembedded.yml   | 1 +
 ci/meta-virtualization.yml | 1 +
 ci/meta-zephyr.yml         | 1 +
 5 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/ci/base.yml b/ci/base.yml
index 4c997463..6cb18589 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -5,7 +5,7 @@ distro: poky

 defaults:
   repos:
-    refspec: master
+    refspec: kirkstone

 repos:
   meta-arm:
diff --git a/ci/clang.yml b/ci/clang.yml
index a2063f19..e5e7dd5f 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -4,6 +4,7 @@ header:
 repos:
   meta-clang:
     url: https://github.com/kraj/meta-clang
+    refspec: master

 local_conf_header:
   clang: |
diff --git a/ci/meta-openembedded.yml b/ci/meta-openembedded.yml
index bed338da..dd0f6633 100644
--- a/ci/meta-openembedded.yml
+++ b/ci/meta-openembedded.yml
@@ -4,6 +4,7 @@ header:
 repos:
   meta-openembedded:
     url: https://git.openembedded.org/meta-openembedded
+    refspec: master
     layers:
       meta-filesystems:
       meta-networking:
diff --git a/ci/meta-virtualization.yml b/ci/meta-virtualization.yml
index 1cd0e21a..8791fc3b 100644
--- a/ci/meta-virtualization.yml
+++ b/ci/meta-virtualization.yml
@@ -6,3 +6,4 @@ header:
 repos:
   meta-virtualization:
     url: git://git.yoctoproject.org/meta-virtualization
+    refspec: master
diff --git a/ci/meta-zephyr.yml b/ci/meta-zephyr.yml
index bdd0e2bb..df31ce61 100644
--- a/ci/meta-zephyr.yml
+++ b/ci/meta-zephyr.yml
@@ -6,6 +6,7 @@ header:
 repos:
   meta-zephyr:
     url: https://git.yoctoproject.org/git/meta-zephyr
+    refspec: master
     layers:
       meta-zephyr-core:

--
2.25.1

--_000_PA4PR08MB7411E05891C6F07ED91865A7E8FA9PA4PR08MB7411eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
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
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">This is now out of date, v2 incoming.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Ross<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">meta-arm@lists.yoct=
oproject.org &lt;meta-arm@lists.yoctoproject.org&gt; on behalf of Ross Burt=
on via lists.yoctoproject.org &lt;ross.burton=3Darm.com@lists.yoctoproject.=
org&gt;<br>
<b>Date: </b>Tuesday, 26 April 2022 at 16:00<br>
<b>To: </b>meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.=
org&gt;<br>
<b>Subject: </b>[meta-arm] [PATCH] CI: use kirkstone branch, not master<o:p=
></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt">Until we have released and branched meta-arm we're tracking kir=
kstone, not<br>
master.&nbsp; oe-core has branched and master is changing fast, so switch<b=
r>
the default branch now.<br>
<br>
Signed-off-by: Ross Burton &lt;ross.burton@arm.com&gt;<br>
---<br>
&nbsp;ci/base.yml&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 +-<br>
&nbsp;ci/clang.yml&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | 1 +<br>
&nbsp;ci/meta-openembedded.yml&nbsp;&nbsp; | 1 +<br>
&nbsp;ci/meta-virtualization.yml | 1 +<br>
&nbsp;ci/meta-zephyr.yml&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
1 +<br>
&nbsp;5 files changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/ci/base.yml b/ci/base.yml<br>
index 4c997463..6cb18589 100644<br>
--- a/ci/base.yml<br>
+++ b/ci/base.yml<br>
@@ -5,7 +5,7 @@ distro: poky<br>
&nbsp;<br>
&nbsp;defaults:<br>
&nbsp;&nbsp; repos:<br>
-&nbsp;&nbsp;&nbsp; refspec: master<br>
+&nbsp;&nbsp;&nbsp; refspec: kirkstone<br>
&nbsp;<br>
&nbsp;repos:<br>
&nbsp;&nbsp; meta-arm:<br>
diff --git a/ci/clang.yml b/ci/clang.yml<br>
index a2063f19..e5e7dd5f 100644<br>
--- a/ci/clang.yml<br>
+++ b/ci/clang.yml<br>
@@ -4,6 +4,7 @@ header:<br>
&nbsp;repos:<br>
&nbsp;&nbsp; meta-clang:<br>
&nbsp;&nbsp;&nbsp;&nbsp; url: <a href=3D"https://github.com/kraj/meta-clang=
">https://github.com/kraj/meta-clang</a><br>
+&nbsp;&nbsp;&nbsp; refspec: master<br>
&nbsp;<br>
&nbsp;local_conf_header:<br>
&nbsp;&nbsp; clang: |<br>
diff --git a/ci/meta-openembedded.yml b/ci/meta-openembedded.yml<br>
index bed338da..dd0f6633 100644<br>
--- a/ci/meta-openembedded.yml<br>
+++ b/ci/meta-openembedded.yml<br>
@@ -4,6 +4,7 @@ header:<br>
&nbsp;repos:<br>
&nbsp;&nbsp; meta-openembedded:<br>
&nbsp;&nbsp;&nbsp;&nbsp; url: <a href=3D"https://git.openembedded.org/meta-=
openembedded">https://git.openembedded.org/meta-openembedded</a><br>
+&nbsp;&nbsp;&nbsp; refspec: master<br>
&nbsp;&nbsp;&nbsp;&nbsp; layers:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-filesystems:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-networking:<br>
diff --git a/ci/meta-virtualization.yml b/ci/meta-virtualization.yml<br>
index 1cd0e21a..8791fc3b 100644<br>
--- a/ci/meta-virtualization.yml<br>
+++ b/ci/meta-virtualization.yml<br>
@@ -6,3 +6,4 @@ header:<br>
&nbsp;repos:<br>
&nbsp;&nbsp; meta-virtualization:<br>
&nbsp;&nbsp;&nbsp;&nbsp; url: git://git.yoctoproject.org/meta-virtualizatio=
n<br>
+&nbsp;&nbsp;&nbsp; refspec: master<br>
diff --git a/ci/meta-zephyr.yml b/ci/meta-zephyr.yml<br>
index bdd0e2bb..df31ce61 100644<br>
--- a/ci/meta-zephyr.yml<br>
+++ b/ci/meta-zephyr.yml<br>
@@ -6,6 +6,7 @@ header:<br>
&nbsp;repos:<br>
&nbsp;&nbsp; meta-zephyr:<br>
&nbsp;&nbsp;&nbsp;&nbsp; url: <a href=3D"https://git.yoctoproject.org/git/m=
eta-zephyr">https://git.yoctoproject.org/git/meta-zephyr</a><br>
+&nbsp;&nbsp;&nbsp; refspec: master<br>
&nbsp;&nbsp;&nbsp;&nbsp; layers:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-zephyr-core:<br>
&nbsp;<br>
-- <br>
2.25.1<o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_PA4PR08MB7411E05891C6F07ED91865A7E8FA9PA4PR08MB7411eurp_--

