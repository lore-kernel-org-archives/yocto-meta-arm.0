Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.55])
 by mx.groups.io with SMTP id smtpd.web08.908.1604334847541816997
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 08:34:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=J8d024lh;
 spf=pass (domain: arm.com, ip: 40.107.15.55, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVQbhnZLvz8bgTnKYw39BR7XOK6qjzfYcObKKNVs9sY=;
 b=J8d024lhkF0df4t6jCYZyT20eNbfl1TXd0hGK4j1xgmE94WTRo2aOk3xtNWDcq00uQkvt9yquQMOP7f9txSzcVUfDbW+E0DBks8CIdH6sPtdlzbdPVn8jNp3Yv1SybG5k82+DT0YWMs1cc3EYx7HJRO6KP+2+7QMdboBJLUBlLM=
Received: from AM6PR01CA0038.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::15) by VI1PR08MB2702.eurprd08.prod.outlook.com
 (2603:10a6:802:1e::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Mon, 2 Nov
 2020 16:34:02 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::9a) by AM6PR01CA0038.outlook.office365.com
 (2603:10a6:20b:e0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Mon, 2 Nov 2020 16:34:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Mon, 2 Nov 2020 16:34:02 +0000
Received: ("Tessian outbound c189680f801b:v64"); Mon, 02 Nov 2020 16:34:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: df1470e87eb5a22d
X-CR-MTA-TID: 64aa7808
Received: from 5f0a1992a0cc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D6455243-AB3E-4B00-9842-3A98ABB45086.1;
	Mon, 02 Nov 2020 16:33:44 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5f0a1992a0cc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 02 Nov 2020 16:33:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvbrcqyFxPSe0unLgR+htUWrdGpoPt+/YLLAOwIg/FcC6PaxV27gWjZfdIl5zA9jtOJR+44j23A9GapEOg19rkFeMmDlJhlrxZG4T8JntgGeg8N+G4glQyLc7kBarO0OTN4rvyqLFg//0oAiEuPiQFhxShSk/frM07p4s/KtjqY13o6ATMKnJcLlawkzgQge+MrEEfAV9JLACxekoZ8HG92ELjxbTMb9wsWtbtR8XD3WePDXyCkTUaDCbQUJTlAh4STWZzARpz5WAMYGNetNpMQvYtluGcMR+4b+O+Oit6U6FgQcMzyBQys+6nmXVCErdULyR9hoQGiLZ4+L7Im1pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVQbhnZLvz8bgTnKYw39BR7XOK6qjzfYcObKKNVs9sY=;
 b=E0KI7vlkC+xEI00E0wxEw3wGrap6RUgnqJZmIT8v00vfxSXoXPRG41opTy4uaswCEQoSIqbjnMXgK4QPNWVgGM9975LvB+2Y0s0SBpoZuhnI4YQMEW6Tv/YO4pv77GweYlN183XWzRH/lRjCKpf9ouv35BtX4sHqFrsPM1O61pIX5A4lvnuPe9R6BkNXC3AjaqufRUZtgjGYyJZcZuD9e9oXMd3Smu5ESKOcYp4tEm5l93qrbEbgqJ5trGnRE2Mmam4989g9Jgqmnzt6qkQhUm4jWSAg0EdOs1HNGcqpJPyaqbef8o9uQJglSH2b0JnuE/IJk2bD6rocFUQi2u9Z8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVQbhnZLvz8bgTnKYw39BR7XOK6qjzfYcObKKNVs9sY=;
 b=J8d024lhkF0df4t6jCYZyT20eNbfl1TXd0hGK4j1xgmE94WTRo2aOk3xtNWDcq00uQkvt9yquQMOP7f9txSzcVUfDbW+E0DBks8CIdH6sPtdlzbdPVn8jNp3Yv1SybG5k82+DT0YWMs1cc3EYx7HJRO6KP+2+7QMdboBJLUBlLM=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18)
 by AM4PR0802MB2161.eurprd08.prod.outlook.com (2603:10a6:200:5b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Mon, 2 Nov
 2020 16:33:42 +0000
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::105e:371d:a567:a068]) by AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::105e:371d:a567:a068%7]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 16:33:42 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm-bsp/linux-linaro-arm-5.4: fixup perf to build with gcc 10
Date: Mon,  2 Nov 2020 22:03:30 +0530
Message-Id: <20201102163330.29896-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-ClientProxiedBy: LO2P265CA0513.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::20) To AM0PR08MB3409.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by LO2P265CA0513.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:13b::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27 via Frontend Transport; Mon, 2 Nov 2020 16:33:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0c36909e-106f-4d4c-0f6b-08d87f4d1b55
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2161:|VI1PR08MB2702:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB27027AA501EAD4CD38E5363BFA100@VI1PR08MB2702.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:372;OLM:372;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 P+AMzClp543yjemRXKCRFisC2Cy2IqRFvGhpPHqEXPCFNlHouIJC0r048VhofMjI6h8oZubAKs9QmAx4SvRobNB8eaVzunLWooM7DVi10K7GwbG/2WgJ5/OI9keFDzfrGB7Mcb84fCvrNTQ+x6Ec+6aHlENjVvLgzSJWBAAThF0UiIlgy0wG2pAAbHAwj4oXRbUz+RMv8f9m8cKAOFxfZUA8/j/mSLr0B2wfdEAuQmhrFCtkF/SyXBSk+577/1he0Sla3yNcRCejDDjN2MVFsgknqAKwDM1XldmfvxPUtEluZ6CnGLkURz0idk641BZ5cPWu9fXdxAE9CSt/5bxa5r5nCS8+jKYC7QLMkkXODJksrlK9ymR7+MvcfpiQ8bZ35Sy+pvFopkPB2s1flgFVrp9niqXYXyLmWsQbpCtsk9hMz1/9m9a6u/0ey/vYPo0WmAx+04Zu8e7zd4i12m5okg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3409.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(186003)(86362001)(966005)(66476007)(66556008)(83380400001)(36756003)(66946007)(30864003)(16526019)(26005)(1076003)(6916009)(4326008)(6486002)(5660300002)(52116002)(478600001)(316002)(956004)(2906002)(8936002)(6666004)(7696005)(2616005)(8676002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Xe63MrXQ1B1/Lg72ASx64nXUtzsuOZeOI4tvZUYjV7yAoGaYRgSP5RiJ9CWt3omzBHAaYjb+w2BVewH2l8LaaBUeKIf2t7n7VQaKTwEcqQfk/iRqPng4Vqtclb5LmmQpml4s8XddkCTzQJ+/GAvc01vhx7SpZv+OmSboWeNncH5ZFMvXzjOUyEjHDp9tP3RSo9rmwpxD6+kBm3E8Mraa6LntSvzM7Bcrw5lklypbKxpzUmSQC4z1AizgdrN0vzwMRz8Uch2wjCDP6rreR+8uOH/70OWRWiBI55e2r2A1RrQUXpJq0/Q3D1HtsqXP98FvrfOf6zmiFsJxtLTokI+4V1mv0/DT2L0dpbspAQIcoeNISzH2uiq1x1Ncss64x5uPwC9LhvsYCEunNs1pFUl9E7skMiSMGZZZWKR/246BTaVQSDPtHAFiW4JYGUKdcseLA8vOetm1jVtyvJnSAUfg8vn5lU5wgSGAA8FWbpD8a1RP8r8wnuTYwBKhr/a80ZjtcPz88SzxZSbxMdJUJBX80Uj9hilp9v2usXBeHyvxHnjx6TTnSIYp0CcYelenR3SZrO9IGLopAaDiyuMiCMpvgB4e0Omw3ZNChD9iY/7ETFwfL1KuNzhZiFoV2obor4JeR517SYWgHUuKRwu1ccS7jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2161
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	393603e8-1269-4f14-1d1a-08d87f4d0f5c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WyLwtu0bmhXjRVIDlCNEqxEDt2J9FsGV1rb17J8h5rAJd3J6yu0IQe3uig8TQNfIZyE7QttFFz3eh0QyQem1xT2GoVdkiAImAe9ClaRZJ4yZbzJab5CtAoRQYSwWdEcrtwhtoMlb13gr+R+tWvGD2s3bErm5Pc+nQ5zdfagbpNQ96dOut1zB86LxJSWOzm6t+f5el3ThAr+WQWdTqIbvjItraHJftmRQ1JZ8/wMvQgic+bbex8NgPKy8EwL8XRZ6hNFJkhr3qvpvDWZggH3jqyISu/rEqbMVBczTaK9/ihhwXtIyiAZgvoMynDO08OqEiHPmgItAWoDX9GzIiNinOSPs8VYGjvFXKRr66JV0wm4YEMsgXEViA5fviDweCYGZsLbvBn2ocD2LJOXTqBGy/M6N4oRubX/ZmJD3l/GZjL1AazAAvRJmvNVHsfKUXPUuRyF3oZsU11iByyfeqmvgqLdXYiVH+MULbeTSQGEDUkRUn0e+P3XG/0ZH9416Uzem
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(46966005)(186003)(47076004)(81166007)(6486002)(8676002)(956004)(4326008)(82740400003)(70206006)(70586007)(8936002)(26005)(36756003)(83380400001)(16526019)(478600001)(82310400003)(356005)(336012)(86362001)(2906002)(316002)(36906005)(6916009)(7696005)(6666004)(2616005)(5660300002)(1076003)(30864003)(966005)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 16:34:02.0035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c36909e-106f-4d4c-0f6b-08d87f4d1b55
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2702
Content-Type: text/plain

Many errors were observed while trying to build perf with gcc 10.
There were few patches which were merged on 5.4 stable which were missing in
our kernel repository, backporting the same here.

Change-Id: I4c4104fd3c99a60706662cc05b18f3ee94c7afa2
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 .../perf-fixup-gcc10-01.patch                 |  76 ++++++
 .../perf-fixup-gcc10-02.patch                 |  50 ++++
 .../perf-fixup-gcc10-03.patch                 | 246 ++++++++++++++++++
 .../perf-fixup-gcc10-04.patch                 |  45 ++++
 .../linux/linux-linaro-arm_5.4.bb             |   9 +-
 5 files changed, 425 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-01.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-02.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-03.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-04.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-01.patch b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-01.patch
new file mode 100644
index 0000000..efca58f
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-01.patch
@@ -0,0 +1,76 @@
+perf cs-etm: Move definition of 'traceid_list' global variable from header file
+Upstream-Status: Backport https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/patch/tools/perf/util?id=bc79abf4afea97d5ce682aa2bd1095fb74400916
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+
+From bc79abf4afea97d5ce682aa2bd1095fb74400916 Mon Sep 17 00:00:00 2001
+From: Leo Yan <leo.yan@linaro.org>
+Date: Tue, 5 May 2020 21:36:42 +0800
+Subject: perf cs-etm: Move definition of 'traceid_list' global variable from
+ header file
+
+commit 168200b6d6ea0cb5765943ec5da5b8149701f36a upstream.
+
+The variable 'traceid_list' is defined in the header file cs-etm.h,
+if multiple C files include cs-etm.h the compiler might complaint for
+multiple definition of 'traceid_list'.
+
+To fix multiple definition error, move the definition of 'traceid_list'
+into cs-etm.c.
+
+Fixes: cd8bfd8c973e ("perf tools: Add processing of coresight metadata")
+Reported-by: Thomas Backlund <tmb@mageia.org>
+Signed-off-by: Leo Yan <leo.yan@linaro.org>
+Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
+Reviewed-by: Mike Leach <mike.leach@linaro.org>
+Tested-by: Mike Leach <mike.leach@linaro.org>
+Tested-by: Thomas Backlund <tmb@mageia.org>
+Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
+Cc: Jiri Olsa <jolsa@redhat.com>
+Cc: Mark Rutland <mark.rutland@arm.com>
+Cc: Namhyung Kim <namhyung@kernel.org>
+Cc: Peter Zijlstra <peterz@infradead.org>
+Cc: Suzuki Poulouse <suzuki.poulose@arm.com>
+Cc: Tor Jeremiassen <tor@ti.com>
+Cc: linux-arm-kernel@lists.infradead.org
+Link: http://lore.kernel.org/lkml/20200505133642.4756-1-leo.yan@linaro.org
+Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
+Cc: Paul Barker <pbarker@konsulko.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ tools/perf/util/cs-etm.c | 3 +++
+ tools/perf/util/cs-etm.h | 3 ---
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+(limited to 'tools/perf/util')
+
+diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
+index 451eee24165ee..f5a9cb4088080 100644
+--- a/tools/perf/util/cs-etm.c
++++ b/tools/perf/util/cs-etm.c
+@@ -94,6 +94,9 @@ struct cs_etm_queue {
+ 	struct cs_etm_traceid_queue **traceid_queues;
+ };
+ 
++/* RB tree for quick conversion between traceID and metadata pointers */
++static struct intlist *traceid_list;
++
+ static int cs_etm__update_queues(struct cs_etm_auxtrace *etm);
+ static int cs_etm__process_queues(struct cs_etm_auxtrace *etm);
+ static int cs_etm__process_timeless_queues(struct cs_etm_auxtrace *etm,
+diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
+index 650ecc2a63492..4ad925d6d7996 100644
+--- a/tools/perf/util/cs-etm.h
++++ b/tools/perf/util/cs-etm.h
+@@ -114,9 +114,6 @@ enum cs_etm_isa {
+ 	CS_ETM_ISA_T32,
+ };
+ 
+-/* RB tree for quick conversion between traceID and metadata pointers */
+-struct intlist *traceid_list;
+-
+ struct cs_etm_queue;
+ 
+ struct cs_etm_packet {
+-- 
+cgit 1.2.3-1.el7
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-02.patch b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-02.patch
new file mode 100644
index 0000000..b512d3e
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-02.patch
@@ -0,0 +1,50 @@
+perf tests bp_account: Make global variable static
+Upstream-Status: Backport https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/patch/tools/perf/tests/bp_account.c?id=73d2d6b421dfdc66b4615452a94efcece27a3c21
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+
+From 73d2d6b421dfdc66b4615452a94efcece27a3c21 Mon Sep 17 00:00:00 2001
+From: Arnaldo Carvalho de Melo <acme@redhat.com>
+Date: Mon, 2 Mar 2020 11:13:19 -0300
+Subject: perf tests bp_account: Make global variable static
+
+commit cff20b3151ccab690715cb6cf0f5da5cccb32adf upstream.
+
+To fix the build with newer gccs, that without this patch exit with:
+
+    LD       /tmp/build/perf/tests/perf-in.o
+  ld: /tmp/build/perf/tests/bp_account.o:/git/perf/tools/perf/tests/bp_account.c:22: multiple definition of `the_var'; /tmp/build/perf/tests/bp_signal.o:/git/perf/tools/perf/tests/bp_signal.c:38: first defined here
+  make[4]: *** [/git/perf/tools/build/Makefile.build:145: /tmp/build/perf/tests/perf-in.o] Error 1
+
+First noticed in fedora:rawhide/32 with:
+
+  [perfbuilder@a5ff49d6e6e4 ~]$ gcc --version
+  gcc (GCC) 10.0.1 20200216 (Red Hat 10.0.1-0.8)
+
+Reported-by: Jiri Olsa <jolsa@kernel.org>
+Cc: Adrian Hunter <adrian.hunter@intel.com>
+Cc: Namhyung Kim <namhyung@kernel.org>
+Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
+Cc: Ben Hutchings <ben@decadent.org.uk>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ tools/perf/tests/bp_account.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+(limited to 'tools/perf/tests/bp_account.c')
+
+diff --git a/tools/perf/tests/bp_account.c b/tools/perf/tests/bp_account.c
+index 016bba2c142db..55a9de311d7b0 100644
+--- a/tools/perf/tests/bp_account.c
++++ b/tools/perf/tests/bp_account.c
+@@ -23,7 +23,7 @@
+ #include "../perf-sys.h"
+ #include "cloexec.h"
+ 
+-volatile long the_var;
++static volatile long the_var;
+ 
+ static noinline int test_function(void)
+ {
+-- 
+cgit 1.2.3-1.el7
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-03.patch b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-03.patch
new file mode 100644
index 0000000..8b8a299
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-03.patch
@@ -0,0 +1,246 @@
+perf bench: Share some global variables to fix build with gcc 10
+Upstream-Status: Backport https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/tools/perf/bench?h=linux-5.4.y&id=df35e878d0a51755fb500e2e8e29c7ebb0239756
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+
+From df35e878d0a51755fb500e2e8e29c7ebb0239756 Mon Sep 17 00:00:00 2001
+From: Arnaldo Carvalho de Melo <acme@redhat.com>
+Date: Mon, 2 Mar 2020 12:09:38 -0300
+Subject: perf bench: Share some global variables to fix build with gcc 10
+
+commit e4d9b04b973b2dbce7b42af95ea70d07da1c936d upstream.
+
+Noticed with gcc 10 (fedora rawhide) that those variables were not being
+declared as static, so end up with:
+
+  ld: /tmp/build/perf/bench/epoll-wait.o:/git/perf/tools/perf/bench/epoll-wait.c:93: multiple definition of `end'; /tmp/build/perf/bench/futex-hash.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
+  ld: /tmp/build/perf/bench/epoll-wait.o:/git/perf/tools/perf/bench/epoll-wait.c:93: multiple definition of `start'; /tmp/build/perf/bench/futex-hash.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
+  ld: /tmp/build/perf/bench/epoll-wait.o:/git/perf/tools/perf/bench/epoll-wait.c:93: multiple definition of `runtime'; /tmp/build/perf/bench/futex-hash.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
+  ld: /tmp/build/perf/bench/epoll-ctl.o:/git/perf/tools/perf/bench/epoll-ctl.c:38: multiple definition of `end'; /tmp/build/perf/bench/futex-hash.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
+  ld: /tmp/build/perf/bench/epoll-ctl.o:/git/perf/tools/perf/bench/epoll-ctl.c:38: multiple definition of `start'; /tmp/build/perf/bench/futex-hash.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
+  ld: /tmp/build/perf/bench/epoll-ctl.o:/git/perf/tools/perf/bench/epoll-ctl.c:38: multiple definition of `runtime'; /tmp/build/perf/bench/futex-hash.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
+  make[4]: *** [/git/perf/tools/build/Makefile.build:145: /tmp/build/perf/bench/perf-in.o] Error 1
+
+Prefix those with bench__ and add them to bench/bench.h, so that we can
+share those on the tools needing to access those variables from signal
+handlers.
+
+Acked-by: Thomas Gleixner <tglx@linutronix.de>
+Cc: Adrian Hunter <adrian.hunter@intel.com>
+Cc: Davidlohr Bueso <dave@stgolabs.net>
+Cc: Jiri Olsa <jolsa@kernel.org>
+Cc: Namhyung Kim <namhyung@kernel.org>
+Link: http://lore.kernel.org/lkml/20200303155811.GD13702@kernel.org
+Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
+Cc: Ben Hutchings <ben@decadent.org.uk>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ tools/perf/bench/bench.h         |  4 ++++
+ tools/perf/bench/epoll-ctl.c     |  7 +++----
+ tools/perf/bench/epoll-wait.c    | 11 +++++------
+ tools/perf/bench/futex-hash.c    | 12 ++++++------
+ tools/perf/bench/futex-lock-pi.c | 11 +++++------
+ 5 files changed, 23 insertions(+), 22 deletions(-)
+
+(limited to 'tools/perf/bench')
+
+diff --git a/tools/perf/bench/bench.h b/tools/perf/bench/bench.h
+index fddb3ced9db62..4aa6de1aa67dc 100644
+--- a/tools/perf/bench/bench.h
++++ b/tools/perf/bench/bench.h
+@@ -2,6 +2,10 @@
+ #ifndef BENCH_H
+ #define BENCH_H
+ 
++#include <sys/time.h>
++
++extern struct timeval bench__start, bench__end, bench__runtime;
++
+ /*
+  * The madvise transparent hugepage constants were added in glibc
+  * 2.13. For compatibility with older versions of glibc, define these
+diff --git a/tools/perf/bench/epoll-ctl.c b/tools/perf/bench/epoll-ctl.c
+index bb617e5688412..a7526c05df382 100644
+--- a/tools/perf/bench/epoll-ctl.c
++++ b/tools/perf/bench/epoll-ctl.c
+@@ -35,7 +35,6 @@
+ 
+ static unsigned int nthreads = 0;
+ static unsigned int nsecs    = 8;
+-struct timeval start, end, runtime;
+ static bool done, __verbose, randomize;
+ 
+ /*
+@@ -94,8 +93,8 @@ static void toggle_done(int sig __maybe_unused,
+ {
+ 	/* inform all threads that we're done for the day */
+ 	done = true;
+-	gettimeofday(&end, NULL);
+-	timersub(&end, &start, &runtime);
++	gettimeofday(&bench__end, NULL);
++	timersub(&bench__end, &bench__start, &bench__runtime);
+ }
+ 
+ static void nest_epollfd(void)
+@@ -361,7 +360,7 @@ int bench_epoll_ctl(int argc, const char **argv)
+ 
+ 	threads_starting = nthreads;
+ 
+-	gettimeofday(&start, NULL);
++	gettimeofday(&bench__start, NULL);
+ 
+ 	do_threads(worker, cpu);
+ 
+diff --git a/tools/perf/bench/epoll-wait.c b/tools/perf/bench/epoll-wait.c
+index 7af694437f4ea..d1c5cb526b9ff 100644
+--- a/tools/perf/bench/epoll-wait.c
++++ b/tools/perf/bench/epoll-wait.c
+@@ -90,7 +90,6 @@
+ 
+ static unsigned int nthreads = 0;
+ static unsigned int nsecs    = 8;
+-struct timeval start, end, runtime;
+ static bool wdone, done, __verbose, randomize, nonblocking;
+ 
+ /*
+@@ -276,8 +275,8 @@ static void toggle_done(int sig __maybe_unused,
+ {
+ 	/* inform all threads that we're done for the day */
+ 	done = true;
+-	gettimeofday(&end, NULL);
+-	timersub(&end, &start, &runtime);
++	gettimeofday(&bench__end, NULL);
++	timersub(&bench__end, &bench__start, &bench__runtime);
+ }
+ 
+ static void print_summary(void)
+@@ -287,7 +286,7 @@ static void print_summary(void)
+ 
+ 	printf("\nAveraged %ld operations/sec (+- %.2f%%), total secs = %d\n",
+ 	       avg, rel_stddev_stats(stddev, avg),
+-	       (int) runtime.tv_sec);
++	       (int)bench__runtime.tv_sec);
+ }
+ 
+ static int do_threads(struct worker *worker, struct perf_cpu_map *cpu)
+@@ -479,7 +478,7 @@ int bench_epoll_wait(int argc, const char **argv)
+ 
+ 	threads_starting = nthreads;
+ 
+-	gettimeofday(&start, NULL);
++	gettimeofday(&bench__start, NULL);
+ 
+ 	do_threads(worker, cpu);
+ 
+@@ -519,7 +518,7 @@ int bench_epoll_wait(int argc, const char **argv)
+ 		qsort(worker, nthreads, sizeof(struct worker), cmpworker);
+ 
+ 	for (i = 0; i < nthreads; i++) {
+-		unsigned long t = worker[i].ops/runtime.tv_sec;
++		unsigned long t = worker[i].ops / bench__runtime.tv_sec;
+ 
+ 		update_stats(&throughput_stats, t);
+ 
+diff --git a/tools/perf/bench/futex-hash.c b/tools/perf/bench/futex-hash.c
+index 8ba0c3330a9a2..21776862e940f 100644
+--- a/tools/perf/bench/futex-hash.c
++++ b/tools/perf/bench/futex-hash.c
+@@ -37,7 +37,7 @@ static unsigned int nfutexes = 1024;
+ static bool fshared = false, done = false, silent = false;
+ static int futex_flag = 0;
+ 
+-struct timeval start, end, runtime;
++struct timeval bench__start, bench__end, bench__runtime;
+ static pthread_mutex_t thread_lock;
+ static unsigned int threads_starting;
+ static struct stats throughput_stats;
+@@ -103,8 +103,8 @@ static void toggle_done(int sig __maybe_unused,
+ {
+ 	/* inform all threads that we're done for the day */
+ 	done = true;
+-	gettimeofday(&end, NULL);
+-	timersub(&end, &start, &runtime);
++	gettimeofday(&bench__end, NULL);
++	timersub(&bench__end, &bench__start, &bench__runtime);
+ }
+ 
+ static void print_summary(void)
+@@ -114,7 +114,7 @@ static void print_summary(void)
+ 
+ 	printf("%sAveraged %ld operations/sec (+- %.2f%%), total secs = %d\n",
+ 	       !silent ? "\n" : "", avg, rel_stddev_stats(stddev, avg),
+-	       (int) runtime.tv_sec);
++	       (int)bench__runtime.tv_sec);
+ }
+ 
+ int bench_futex_hash(int argc, const char **argv)
+@@ -161,7 +161,7 @@ int bench_futex_hash(int argc, const char **argv)
+ 
+ 	threads_starting = nthreads;
+ 	pthread_attr_init(&thread_attr);
+-	gettimeofday(&start, NULL);
++	gettimeofday(&bench__start, NULL);
+ 	for (i = 0; i < nthreads; i++) {
+ 		worker[i].tid = i;
+ 		worker[i].futex = calloc(nfutexes, sizeof(*worker[i].futex));
+@@ -204,7 +204,7 @@ int bench_futex_hash(int argc, const char **argv)
+ 	pthread_mutex_destroy(&thread_lock);
+ 
+ 	for (i = 0; i < nthreads; i++) {
+-		unsigned long t = worker[i].ops/runtime.tv_sec;
++		unsigned long t = worker[i].ops / bench__runtime.tv_sec;
+ 		update_stats(&throughput_stats, t);
+ 		if (!silent) {
+ 			if (nfutexes == 1)
+diff --git a/tools/perf/bench/futex-lock-pi.c b/tools/perf/bench/futex-lock-pi.c
+index d0cae8125423f..30d97121dc4fb 100644
+--- a/tools/perf/bench/futex-lock-pi.c
++++ b/tools/perf/bench/futex-lock-pi.c
+@@ -37,7 +37,6 @@ static bool silent = false, multi = false;
+ static bool done = false, fshared = false;
+ static unsigned int nthreads = 0;
+ static int futex_flag = 0;
+-struct timeval start, end, runtime;
+ static pthread_mutex_t thread_lock;
+ static unsigned int threads_starting;
+ static struct stats throughput_stats;
+@@ -64,7 +63,7 @@ static void print_summary(void)
+ 
+ 	printf("%sAveraged %ld operations/sec (+- %.2f%%), total secs = %d\n",
+ 	       !silent ? "\n" : "", avg, rel_stddev_stats(stddev, avg),
+-	       (int) runtime.tv_sec);
++	       (int)bench__runtime.tv_sec);
+ }
+ 
+ static void toggle_done(int sig __maybe_unused,
+@@ -73,8 +72,8 @@ static void toggle_done(int sig __maybe_unused,
+ {
+ 	/* inform all threads that we're done for the day */
+ 	done = true;
+-	gettimeofday(&end, NULL);
+-	timersub(&end, &start, &runtime);
++	gettimeofday(&bench__end, NULL);
++	timersub(&bench__end, &bench__start, &bench__runtime);
+ }
+ 
+ static void *workerfn(void *arg)
+@@ -185,7 +184,7 @@ int bench_futex_lock_pi(int argc, const char **argv)
+ 
+ 	threads_starting = nthreads;
+ 	pthread_attr_init(&thread_attr);
+-	gettimeofday(&start, NULL);
++	gettimeofday(&bench__start, NULL);
+ 
+ 	create_threads(worker, thread_attr, cpu);
+ 	pthread_attr_destroy(&thread_attr);
+@@ -211,7 +210,7 @@ int bench_futex_lock_pi(int argc, const char **argv)
+ 	pthread_mutex_destroy(&thread_lock);
+ 
+ 	for (i = 0; i < nthreads; i++) {
+-		unsigned long t = worker[i].ops/runtime.tv_sec;
++		unsigned long t = worker[i].ops / bench__runtime.tv_sec;
+ 
+ 		update_stats(&throughput_stats, t);
+ 		if (!silent)
+-- 
+cgit 1.2.3-1.el7
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-04.patch b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-04.patch
new file mode 100644
index 0000000..dae1222
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-04.patch
@@ -0,0 +1,45 @@
+libtraceevent: Fix build with binutils 2.35
+Upstream-Status: Backport https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/patch/tools/lib/traceevent/plugins/Makefile?id=c2fd34d4311033120fa502aa8bd4723cdeee0103
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+
+From c2fd34d4311033120fa502aa8bd4723cdeee0103 Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <ben@decadent.org.uk>
+Date: Sat, 25 Jul 2020 02:06:23 +0100
+Subject: libtraceevent: Fix build with binutils 2.35
+
+commit 39efdd94e314336f4acbac4c07e0f37bdc3bef71 upstream.
+
+In binutils 2.35, 'nm -D' changed to show symbol versions along with
+symbol names, with the usual @@ separator.  When generating
+libtraceevent-dynamic-list we need just the names, so strip off the
+version suffix if present.
+
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+Tested-by: Salvatore Bonaccorso <carnil@debian.org>
+Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
+Cc: linux-trace-devel@vger.kernel.org
+Cc: stable@vger.kernel.org
+Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ tools/lib/traceevent/plugins/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+(limited to 'tools/lib/traceevent/plugins/Makefile')
+
+diff --git a/tools/lib/traceevent/plugins/Makefile b/tools/lib/traceevent/plugins/Makefile
+index f440989fa55e4..23c3535bcbd6b 100644
+--- a/tools/lib/traceevent/plugins/Makefile
++++ b/tools/lib/traceevent/plugins/Makefile
+@@ -196,7 +196,7 @@ define do_generate_dynamic_list_file
+ 	xargs echo "U w W" | tr 'w ' 'W\n' | sort -u | xargs echo`;\
+ 	if [ "$$symbol_type" = "U W" ];then				\
+ 		(echo '{';                                              \
+-		$(NM) -u -D $1 | awk 'NF>1 {print "\t"$$2";"}' | sort -u;\
++		$(NM) -u -D $1 | awk 'NF>1 {sub("@.*", "", $$2); print "\t"$$2";"}' | sort -u;\
+ 		echo '};';                                              \
+ 		) > $2;                                                 \
+ 	else                                                            \
+-- 
+cgit 1.2.3-1.el7
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
index 577af5e..8e880ed 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
@@ -5,6 +5,13 @@ SRCREV_meta ?= "e32057eca987b7abbe3eb47ba36f06af8711278a"
 KBRANCH ?= "n1sdp"
 KMETA_BRANCH ?= "yocto-5.4"
 
-SRC_URI_append = " file://fix-bfd-link.patch"
+# Apply following patches
+SRC_URI_append = " \
+    file://fix-bfd-link.patch \
+    file://perf-fixup-gcc10-01.patch \
+    file://perf-fixup-gcc10-02.patch \
+    file://perf-fixup-gcc10-03.patch \
+    file://perf-fixup-gcc10-04.patch \
+    "
 
 require linux-linaro-arm.inc
-- 
2.17.1

