Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.64])
 by mx.groups.io with SMTP id smtpd.web10.19717.1599154616551832192
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Sep 2020 10:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=5MvPz+tw;
 spf=pass (domain: arm.com, ip: 40.107.21.64, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2Saczcz/rKNOxgFBnke7ZAM1mZqn7eDiLLVh6vkoy8=;
 b=5MvPz+twt1+5i4RMfwSzVrJeyB9Nv3vLlJmT2mS+kKlAI8qerG/URa7c6oCKhA0p4qabFrkv21NyGQzHfLPuRPB+NKVPfwjqc2x9NUjgZp+D+f8FsBe6hgUXyUqdHAPY7n48Sz8o8INmRV4V7gpLgXLwUy/Ojfr7cm5C5RzS+9k=
Received: from AM5PR0601CA0065.eurprd06.prod.outlook.com (2603:10a6:206::30)
 by HE1PR0801MB2011.eurprd08.prod.outlook.com (2603:10a6:3:49::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Thu, 3 Sep
 2020 17:36:53 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::86) by AM5PR0601CA0065.outlook.office365.com
 (2603:10a6:206::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Thu, 3 Sep 2020 17:36:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16 via Frontend Transport; Thu, 3 Sep 2020 17:36:53 +0000
Received: ("Tessian outbound 7161e0c2a082:v64"); Thu, 03 Sep 2020 17:36:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 815907a45801f2bd
X-CR-MTA-TID: 64aa7808
Received: from 9b36345e52b1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B06D1168-8A97-4C44-B020-9DDDF608D7AA.1;
	Thu, 03 Sep 2020 17:36:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9b36345e52b1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Sep 2020 17:36:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3q7rvkiC7QGKXCbPnfK5EO94DGsYfM+uSuGvzZCIZJBn58A1PSudLx9I21sZWqiK00Ny1AxRi7i4/0lilrM3IXdhqeYdwKxsHepOIWOUuWnnlcoNL1vqsOxStz/t9WPlteebLDGXxXX2PepP95CwMk5rfno6+STeolOItlgzpsjQ/8ks4J8Oc3YptZvP6LZ6ouRactIakItbUnMPCrCoD7V7A3nbUSRgMbUW8SEPLqBD76G8ignsWK0t91gaBa5zslm750nQHxdpidKuAbvzq52FHcZQpo9DdQkWVW4i2HSwQdzhcOcKXf8AriIiqY+dY4Og6ivJ5MdzOolPvYEOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2Saczcz/rKNOxgFBnke7ZAM1mZqn7eDiLLVh6vkoy8=;
 b=WeoDRSUcRGTh3nUZyCbgdbbQ3/5vhRm3TkJrSjVu/lGyD0Giyl1fC32E9HMEhPU6CXCmETw9fuEBNJpmFYBJ/yYfd+RFhnzDW5GsIR6zU3eLIKLYXqZA/+4URBglbnewhxaBtIxq985yHMct99m3YzImK9/pNqTScQtm63Wm5QfmoyJH9mgU93RVawiT7EqvnwZp24GocaLpZpHudEXgPZy5dCnS+8VunnqqLbDy2zPijXk8KHux8ObCJBOuBbOo5VO9z3F56au1WvSfHDHc3GyEUl9HZZyyTZcAq8CeQ1hQjJe7ieoL+53xsbfoZc5QgkugiR8//jr2LZsYPmhGmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2Saczcz/rKNOxgFBnke7ZAM1mZqn7eDiLLVh6vkoy8=;
 b=5MvPz+twt1+5i4RMfwSzVrJeyB9Nv3vLlJmT2mS+kKlAI8qerG/URa7c6oCKhA0p4qabFrkv21NyGQzHfLPuRPB+NKVPfwjqc2x9NUjgZp+D+f8FsBe6hgUXyUqdHAPY7n48Sz8o8INmRV4V7gpLgXLwUy/Ojfr7cm5C5RzS+9k=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com (2603:10a6:3:50::23)
 by HE1PR08MB2940.eurprd08.prod.outlook.com (2603:10a6:7:30::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Thu, 3 Sep
 2020 17:36:45 +0000
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::5007:f0b0:b7eb:c8b]) by HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::5007:f0b0:b7eb:c8b%12]) with mapi id 15.20.3348.016; Thu, 3 Sep 2020
 17:36:45 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH v2 4/4] arm-bsp: use neoverse-n1 for N1SDP
Date: Thu,  3 Sep 2020 13:36:18 -0400
Message-Id: <20200903173618.2910-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200903173618.2910-1-jon.mason@arm.com>
References: <20200903173618.2910-1-jon.mason@arm.com>
X-ClientProxiedBy: DM6PR06CA0053.namprd06.prod.outlook.com
 (2603:10b6:5:54::30) To HE1PR0801MB2058.eurprd08.prod.outlook.com
 (2603:10a6:3:50::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by DM6PR06CA0053.namprd06.prod.outlook.com (2603:10b6:5:54::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Thu, 3 Sep 2020 17:36:42 +0000
Received: by vm (sSMTP sendmail emulation); Thu, 03 Sep 2020 13:36:38 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [136.56.1.171]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 95288342-f4fd-46b9-faa1-08d8502ff24d
X-MS-TrafficTypeDiagnostic: HE1PR08MB2940:|HE1PR0801MB2011:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB201173094A22C9E4276A58D4F02C0@HE1PR0801MB2011.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 LdKnZoLxQtEWYUMad5leowuOJ52afiK5ZU4I94OS6GlQSp83NTF0hGWTsq4y4MKKGG9CTLhjfUDns68g4PvT9fDYgDMmKSDE4QsFwp8F9VyxG3ld6pi2DjOOHcrAMdNdWsaCXpY9htwa+8Qp7f2H0vSIyPpN36TuFyDAKPQCh8AOOrB96g3Rj1VV9JqQ/eFTXlY24uQw2QmrbDvrTO0/dmWkqsT0fLrwfjhWnLT39Jh972ChMD1tALqBkmGzaOWcF3Ajir1i+xihIIqyh+RcL4ui+LdhV1k7tvVfsW9L387zJj3kLOxJMi9PqqUDTQ9LOTSFm2WX067ioALnxboNHMFqDmtxWX8fjHcx9H/IrozLZ6yGGQ+f0tlhfoQUoMrNKtwgo3XbqnHDN8qG+taWOy2JdQLlvMGOY28HQ9tR8Jmqy3vSaJUsiAtBFT8DAXZs828V0sufqVPuhtllswykgg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0801MB2058.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(1076003)(44832011)(36756003)(86362001)(2616005)(426003)(8936002)(52116002)(8676002)(6666004)(966005)(6916009)(316002)(4326008)(66946007)(42186006)(4744005)(478600001)(83380400001)(66556008)(2906002)(66476007)(186003)(5660300002)(26005)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 21LkJ40CUGFKQ/bTgw9HxhJufsFt5y8K/jPFAMoENOBFT6ZDCUHewHu+htj4Zzd998PF2H48PxeUF181bUsUD6dJEbttYW5xandSUGON3KVDY/T/aAIuE6nAUU7gxieLd6r5oZP4CT3V1JZ8NSQTotdlFetAtnhnvDq37uPosc7kavadKyrV5bNO77Vzx6Bd2Upyy+gZ/LPC877aBuAQA8CtZ0wJv9kleI04WRiPHlBSmZHtniWr3phauXXhztcje+c+bhMptFJhJU391vbT0YOvJ7pwhJFDGz2MQVpa7ZrtEgkvGZlVbyB071ZUVmpr6QGDLCoYQfqphXC6DV02j2R39+g7fIi25OEc6Fewmc8pxO3k2y8KMO+8/GRqjkNxT2DcWA8XbYRxqJRz+DBhqxbvowvCL/sLGs2+hEGJk+ITRcprhkRWpOHrVaixfi9VE3tNMkyE/kjTCLhl6N8abMRKybinzTmdUSfK82fCnG1q1KkjlXPHAKJtuVVsEJcQ/hUKs6MBLRHsEMDQOi6wI+qB+SniZHb+KqQDUh8XkuY2L3/usz7ZAwCmnAFoqosXN4W0wXXFXnmj8w3+oiCQ+cPLEki0sP/O4MXkwCJN6YucV7O6K1JXKlr+BtOLIZbGSHj+nK0Iz299b7WJBQIiig==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2940
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	532f42fb-b725-47f8-6509-08d8502fecec
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	f8eU7ssp5VfGXNvNYcMMfzHhJuHRhFa89pF1qML+zdKqIfA2citmngfSyp1wrAY3R6spujCKWz4XnJb4cwcjbSpIQWUAEMlI8rXjyFawKNF2N4eOyKFG4VTNXNy6u27HhMumBIfFSiFNB433lAQw2NQ0+IBHZtsH17J8YlQBJhmLij9/QiCgiWBCspt978hRWOKLLmChBvBNyAIGWU5t1z+oJzhgManvP6p61V+wQGMK4fC3nQVv/iS119MiUJKXfjOWSccjweSbv8xJPWf8F3lVAuQNgsabzb29/GI7xHxhZcr/NN/LAXpSKUdmWsWff8zRxi4bgs10OZNklNaVeHfxMk0Zw7kV6iJz+gQ3PCpl8dbzez8WdMRV4+WQvQtd2ZgXC/F45fVCdQFBB9uW8QjEOL23sZf4NMMPypbwSH9FJJHbj4g8SZAcpuVcmRHT0FArR+TZ2Se0JpUnL0aIW/KxH/Ok4MG59hlcjyYPrFP4EyUJmWjarE/Lt5yRaTrN
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(46966005)(42186006)(81166007)(82310400003)(44832011)(5660300002)(4326008)(966005)(186003)(70206006)(70586007)(86362001)(26005)(6666004)(6916009)(2906002)(4744005)(36756003)(1076003)(2616005)(83380400001)(336012)(36906005)(478600001)(82740400003)(47076004)(426003)(316002)(8936002)(8676002)(356005)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2020 17:36:53.0667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95288342-f4fd-46b9-faa1-08d8502ff24d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2011
Content-Type: text/plain

Per https://community.arm.com/developer/tools-software/oss-platforms/w/docs/458/neoverse-n1-sdp
The N1SDP is a Neoverse N1.  Use that tuning to get better optimization
for the platform.

Change-Id: I435931abd2537a17a08eae06395137ce185a49dc
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index 506f3dc..e4e6663 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -4,9 +4,7 @@
 #@NAME: N1SDP machine
 #@DESCRIPTION: Machine configuration for N1SDP
 
-TUNE_FEATURES = "aarch64"
-
-require conf/machine/include/arm/arch-armv8a.inc
+require conf/machine/include/tune-neoversen1.inc
 
 KERNEL_IMAGETYPE = "Image"
 KERNEL_DEVICETREE = "n1sdp/n1sdp.dtb"
-- 
2.17.1

