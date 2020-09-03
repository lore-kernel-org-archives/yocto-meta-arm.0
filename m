Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.71])
 by mx.groups.io with SMTP id smtpd.web12.11961.1599133279304414968
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Sep 2020 04:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=fpTIOZ+0;
 spf=pass (domain: arm.com, ip: 40.107.20.71, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWJhqOFC7KmWOLlHYexojRChgQVpzrxfvVQmqVaDO3w=;
 b=fpTIOZ+0aq36EDBC/xeeNjC7ed7oGm/vZiJzGDjvtehg9PL9ziyoOoYdc55Q/JMBhCffyowqF9cyOWaQC/fVJYdUDewf+kVFPRRRR8o3MiMvJYrdDfX2pvRXrWGVXNCbI02W2yvBgNZx9K0dGZfdbwS8lCaGq5ZgdT8Nkc+QRN4=
Received: from AM6PR02CA0033.eurprd02.prod.outlook.com (2603:10a6:20b:6e::46)
 by AM0PR08MB3060.eurprd08.prod.outlook.com (2603:10a6:208:5f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Thu, 3 Sep
 2020 11:41:16 +0000
Received: from AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::a0) by AM6PR02CA0033.outlook.office365.com
 (2603:10a6:20b:6e::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend
 Transport; Thu, 3 Sep 2020 11:41:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT004.mail.protection.outlook.com (10.152.16.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Thu, 3 Sep 2020 11:41:16 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64"); Thu, 03 Sep 2020 11:41:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c87612a3c3f9b9f5
X-CR-MTA-TID: 64aa7808
Received: from 4ad040111dba.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 849DB228-CBE5-42B2-99D1-F7276A0BB73E.1;
	Thu, 03 Sep 2020 11:40:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4ad040111dba.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Sep 2020 11:40:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmOcPMoNn5EHdLUVwEyOFcvEk199x2TSxEMUpIveT8mO9ad0bAjJ87QA9ivyC6U+Z1UKDjR/DzsznZ/Yg2VU7g4m3T/GJP8QzDcTfH4BZQCg2qAWt1ut3um1SFu+4hmjwqj0EkV9cTolC7hkrnt33Ep20qPGLd1hYRx6DkGWL+9tAS7EbEs84ZWd61P4WfZWrBthOhp1FOSn4PwtvREd4JHeo87MEwUsPA5vCjbz3nu6yUE37JJ5uRBmH4mitqgyNJCC81ahsDGOCERV9qSBYZ+KBSxjdmktnP/SybmAcssYlqSdjiPQMjhx2JH4O5pI44iWtdL89a0Qu2lFWvxdgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWJhqOFC7KmWOLlHYexojRChgQVpzrxfvVQmqVaDO3w=;
 b=iBupIpMoD8S8xmXlXry+SRbJXHI2O4YbP11dzRzsJOt7onVy9RF9Is+r9CZC0MHEduM4M78XoszACAuMTmS0M46yMEXzs38eitserVt5wjYcSsbgyQzLq95sDDqWtxdbyg+koIyYKoa1+AI6N3kCVEIJCPqB4m76JcNkCKiyRP6MgBKTG8m7P+YhobS1xJmHGtY6Q7sbNtsd6TmFEINw0d7+pQedumqAVR/bmWC0+0+vOGlhEdwvx4F8TneW1gqn+hxlXWegy4VeUrqMPgA5Fp8/sA+kqyADk/lXE44H4to7sp9oLECz7yIp/i2jjQbhUzIN1fuTZk/oabdnKgAzpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWJhqOFC7KmWOLlHYexojRChgQVpzrxfvVQmqVaDO3w=;
 b=fpTIOZ+0aq36EDBC/xeeNjC7ed7oGm/vZiJzGDjvtehg9PL9ziyoOoYdc55Q/JMBhCffyowqF9cyOWaQC/fVJYdUDewf+kVFPRRRR8o3MiMvJYrdDfX2pvRXrWGVXNCbI02W2yvBgNZx9K0dGZfdbwS8lCaGq5ZgdT8Nkc+QRN4=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.22; Thu, 3 Sep
 2020 11:40:36 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3348.016; Thu, 3 Sep 2020
 11:40:36 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/9] arm-autonomy/xen-devicetree: Use a different sed delimiter character
Date: Thu,  3 Sep 2020 12:40:23 +0100
Message-Id: <7551104042b1556269157a1fa836b9e6bc8378ec.1599133172.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <bff93f4e0c123dc3cfbaf417b7c398e392b9771e.1599133172.git.diego.sueiro@arm.com>
References: <bff93f4e0c123dc3cfbaf417b7c398e392b9771e.1599133172.git.diego.sueiro@arm.com>
X-ClientProxiedBy: LO2P265CA0463.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::19) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by LO2P265CA0463.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a2::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3348.15 via Frontend Transport; Thu, 3 Sep 2020 11:40:32 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 71ddf9fb-55e9-40ec-5262-08d84ffe447c
X-MS-TrafficTypeDiagnostic: AM6PR08MB4934:|AM0PR08MB3060:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3060D21E5536C14589094502922C0@AM0PR08MB3060.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:576;OLM:576;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 VcS0KdpmZGuag2aF+otMse0Jkvz/WukFzU/Gem/DKacQM79wEmiNcdkBhquFQ7y5Oq5Z0uh3AhvfUCDk1n3MdcS2cH5eYZwsuK94BXmkpO/P5LYOlscf0npYwQB+ERgZC1Zu3qjIQhln59T/1AH+aVuj8YDJvWOU+aWAcmV4+5phOKgG4MiNqXcs9J1HmjWiebJgy4SyI+77qwSXJpWLbE+N+nPcy7VMdcUlkkw39AaqZl7t223CTQp+v57aXQSHgU15n6dpA/wl6kRyKS4eqIUS3RgQk0z6E5fRP0nAtDs6gD+GiYRzRVzVA2O3u2/S5VWJURdbI1lpEkdepISDxg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(36756003)(52116002)(2906002)(26005)(478600001)(16576012)(4326008)(44832011)(2616005)(316002)(956004)(186003)(6916009)(6486002)(86362001)(6666004)(66476007)(8676002)(5660300002)(66556008)(66946007)(8936002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 YmifWzdIOGJBuKzbtJPwDe6ExoBXlFTze8/0b2KkXBQ5JZX0jvKuaCq1OX7xnOLy+NFx01OP1fnF1AeDCH4fAWcrXSg64FaEzA6zNQQ/lKtAlZLzH9oS7LdnwLrVoJAnVAV3mHrnD6Vm/FaJXkDkO1YxK6sY0iK2Awugm1sAQIxoKFILFDhmbrefbhYgi+AoEpHbuUNynoqDrzwXy2u9FkiqFGNpEk3VA3CPbri832OVWZs/mCVtq9DksKL9/WJRUWuKdZQwyYDkNg6T9fdrg9zI6Vt4PyC5MGZRS6T56Z0ELIEgEOB3Q8eIOeUi940OYXaBRP1uROCsHLnB+m+FO6WJIY0RDOa9OWn9DCVz22VLF4fbDHCpeyNBw0nRPaHfbX1mr7gdsonsgN149r2daXDuutdboJtLWfDZKx5hDgyZfpBxkNnboEd7I4uSt/hHsoe2z8oKAMiIOeRWVDPMWt7APH8SEu2dJ28blhKE3XHax3yJR5q0zfxCytvo6iNy+nSwJNEHtljyKViysnc7ZAe8HCnsCVwtuAy0skti+NebxUUK6PZPF26O/Vn/1tC/G27J9VkLB9nZO2fVUavEKWrqAX0IhsS+hoNiCTx4btrRlbhmPBTbDCyZgUQSojX2ufuuWykPq0vFl4Aol3EUFA==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4934
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	32544c7c-c902-46aa-0ccb-08d84ffe2aaf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	miAKaYRvM26gzniwiOgFVDPLwpsP6zQzJknapfJgcMAUTAu7iynXaoyux9zXU6xvqGfNw2eZjtxB6YPBSsV+17wvsT/e1X2ZiIciz0GeEp4V2WtaOsbhK+jODjJjAcM/b35/KYi39EWwtNwdSoJz7YKFBD8hnJ+nMKkPyVIyRz3IzZSN2TQXdjGNaYiajQ03b94ArvqHdeNZKA4GflkahrvVkwA+le46H7UEKHSDfTAoH/R11ymC63tFduFVplfBSI5jjvVr9J53XDTcw56nau5iV9L+u193ftTj7LKi1bdS9l07BLxrD/mClukNhUzIPz9USOQgVQQygP0P+fuu1tHjp5CWTVRHqIWUjMuma65S7ZxCrd/MIaYZXYOMDTcCaLyJrgpFmF+6+Tm/qUEZXQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(46966005)(16576012)(36906005)(44832011)(316002)(4326008)(86362001)(36756003)(186003)(6916009)(2616005)(6486002)(82310400003)(6666004)(356005)(8936002)(70206006)(956004)(47076004)(70586007)(2906002)(478600001)(83380400001)(82740400003)(5660300002)(8676002)(336012)(81166007)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2020 11:41:16.1661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71ddf9fb-55e9-40ec-5262-08d84ffe447c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3060
Content-Type: text/plain

In the do_deploy task, replace the current sed delimiter (',') with '?'
since there are use cases where the bootargs variables have the ','
character in it which makes the sed command to fail.

Change-Id: If9b8221404ec63568768bf0f303be7759ba5f64d
Issue-Id: SCM-1065
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../recipes-extended/xen-devicetree/xen-devicetree.bb             | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
index cef5f79..ccbb387 100644
--- a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
+++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
@@ -38,10 +38,10 @@ do_deploy() {
         die "xen.dtsi.in does not exist"
     fi
     cat ${WORKDIR}/xen.dtsi.in \
-        | sed -e "s,###XEN_DOM0_BOOTARGS###,${XEN_DEVICETREE_DOM0_BOOTARGS}," \
-        | sed -e "s,###XEN_XEN_BOOTARGS###,${XEN_DEVICETREE_XEN_BOOTARGS}," \
-        | sed -e "s,###XEN_DOM0_ADDR###,${XEN_DEVICETREE_DOM0_ADDR}," \
-        | sed -e "s,###XEN_DOM0_SIZE###,${XEN_DEVICETREE_DOM0_SIZE}," \
+        | sed -e "s?###XEN_DOM0_BOOTARGS###?${XEN_DEVICETREE_DOM0_BOOTARGS}?" \
+        | sed -e "s?###XEN_XEN_BOOTARGS###?${XEN_DEVICETREE_XEN_BOOTARGS}?" \
+        | sed -e "s?###XEN_DOM0_ADDR###?${XEN_DEVICETREE_DOM0_ADDR}?" \
+        | sed -e "s?###XEN_DOM0_SIZE###?${XEN_DEVICETREE_DOM0_SIZE}?" \
         > ${WORKDIR}/xen.dtsi
 
     # Generate final dtbs
-- 
2.7.4

