Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.73])
 by mx.groups.io with SMTP id smtpd.web08.24012.1605872729533439278
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Nov 2020 03:45:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=jkl7a0h9;
 spf=pass (domain: arm.com, ip: 40.107.15.73, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cITbXEnaLFt9QKwxmhH5+x5fk8Mt68DK0T12uJg+7+8=;
 b=jkl7a0h9g7pjU/0Mc8WNuayp1+TVrhwXBViTSeuiXqLQQUDSNWzwnPQPqpIoG7cXjTGKkymagXuSaO7Ge756McqDU4pUKZudHSa8ACiOrKxnsmOBGhrvRqOMGzfD0EFe+dB87ecM0+fkDOkesR5zlu+YDPH/w3Qik8O3YRUsD4c=
Received: from MRXP264CA0039.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:14::27)
 by DBBPR08MB4313.eurprd08.prod.outlook.com (2603:10a6:10:c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Fri, 20 Nov
 2020 11:45:27 +0000
Received: from VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:14:cafe::c) by MRXP264CA0039.outlook.office365.com
 (2603:10a6:500:14::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Fri, 20 Nov 2020 11:45:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT033.mail.protection.outlook.com (10.152.18.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 11:45:26 +0000
Received: ("Tessian outbound 814be617737e:v71"); Fri, 20 Nov 2020 11:45:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 478133a459b3440b
X-CR-MTA-TID: 64aa7808
Received: from 93993df44d84.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 63DAF489-E3B6-4E00-93F8-FDD828BEF45C.1;
	Fri, 20 Nov 2020 11:45:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 93993df44d84.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 20 Nov 2020 11:45:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+IDE7e4mRnebcRUxg26kYbCYZWHKTTt3wOiAAiAzd+OMOLr5DV4ulL8Jp5aa+td28DtpBg1kewhZFlKEgC+MfrpHmfWFcUSuH5gSj2uieU2RziM+zuz+YdFGqjud0qjnVl152h2UFQTn2SdyWq+/5BuQRs2JX7vKji886dlim/Om2jpEEecQnufxIG6BEjCrm4uc5BDzzSCUSL/EgNF70kpHJcsSEJuG6wv3ULzhr3R083or4cUYTYuBpOOqqv5K9chAaSCEgy95L6c/2KBL+r3seYLQI/lb4Ha3df32sP5cPQaSa+VPC4/C+Wb5oIhuFYap8y+40cS2f5/F5DeTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cITbXEnaLFt9QKwxmhH5+x5fk8Mt68DK0T12uJg+7+8=;
 b=GjxwEqnvbxK8pP2DNbI7is4JvRrSV4dUZjts3geE8SvNE9kC2p6z226sGIbJFZR3t5nhUWQBjF3l2RX9M88izxEnPfSA2cApZnSyTL5SvOujyTlNkf+bAfPwjvqt/IBnOHVvaXPCSzYkIoeR3lKNi/2VKuujcelLE9VZjxnayihoRV9OMl6uvLBAc1T0PxChSinClPTFSBxAubGQl06jljpgiBQhuIY5Nel3R+iJDlzgClL0mI766SfjjWM9gBUBQmlNBMSt7aedKN9ghyFQKTOw1SqmtR8NvRuvTxe89wGvVCXLQZ+v3eb6653PMIjJvRf0/zgbHwm6T7TsECdHrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cITbXEnaLFt9QKwxmhH5+x5fk8Mt68DK0T12uJg+7+8=;
 b=jkl7a0h9g7pjU/0Mc8WNuayp1+TVrhwXBViTSeuiXqLQQUDSNWzwnPQPqpIoG7cXjTGKkymagXuSaO7Ge756McqDU4pUKZudHSa8ACiOrKxnsmOBGhrvRqOMGzfD0EFe+dB87ecM0+fkDOkesR5zlu+YDPH/w3Qik8O3YRUsD4c=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DBBPR08MB6284.eurprd08.prod.outlook.com (2603:10a6:10:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Fri, 20 Nov
 2020 11:45:20 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::7481:42d7:df72:b159]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::7481:42d7:df72:b159%3]) with mapi id 15.20.3589.020; Fri, 20 Nov 2020
 11:45:20 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 4/5] arm-autonomy/xenguest-manager: keep user defined partition order
Date: Fri, 20 Nov 2020 12:44:03 +0100
Message-Id: <20201120114404.730-4-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201120114404.730-1-kamil.dziezyk@arm.com>
References: <20201120114404.730-1-kamil.dziezyk@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO4P123CA0027.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::14) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by LO4P123CA0027.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:151::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 11:45:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: afc1ba4b-cb97-47fb-4070-08d88d49c617
X-MS-TrafficTypeDiagnostic: DBBPR08MB6284:|DBBPR08MB4313:
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB431349F43928F2077C6ACD12FDFF0@DBBPR08MB4313.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 vs8bzc+o14n/nkfdkIDP5b8xwqENVX3/bnah55uV4e2IBwSsZDW9b2YSn/M/Uq2XS7Vp4iSxO0aXqXCGZxJZheDSO3T3TsElfKz+xczoipthtX2xDP+1AGqnvRV0MSld5JZ/M1gtWx9lzhc2q7KCMFjBcZVLNZo66xIPR2NGaYJfTQcXLIDFbtfjEnMmk+M6zFQiXC33MIzXYQqQmrtyZNJIoBpXCq1B6IaWzSmloKog0K8Bm+UBfjFFb6bXSxEYvUB36dPqFUf0BuLqbxHJdKQSZ3K9WzH24mmidl7QmuGx5vB4g1IuNECV0MbUIFuiPKCak+cwbP8ZHvCo+OqvQQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(366004)(396003)(39850400004)(478600001)(44832011)(1076003)(6916009)(186003)(26005)(16526019)(8936002)(8676002)(2906002)(5660300002)(6486002)(66476007)(52116002)(7696005)(66556008)(4326008)(316002)(2616005)(86362001)(956004)(6666004)(36756003)(66946007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 PQeen/MNpQig0xCPPCjKncsb22n9/oD5Ps/cp8j5c/9vHeBnK81ATH65RXXM7CU8DOo0nRNYuaiXs6xREx6pWKrdmCJL+9SU+7hWNNPpgZ+Tc/429RnbRJQfdFS1gSaXlodMffjM1bhWGjH2q4V5Dc9tJVoGKhtLVxIEOcWF4O/f2zE7MlpAeZ6A3XnotdD/vWZ8KI56OaPUTkNmI6BZN7hPBZ71/aHe2B8D6/MdOjAuBWa4vG34tRJZl4b1EjbtOtgU4R5XGFXqoKglZxFxKqekm5qGYurn1SOuT6n8ZyjWaS1RwRI/04+zKzuN7LxrUxzaTDvJuNSCn5d8YvMxbDYFs3u+fsgp1b81bQgzPQnERP5R4Zw3thqs9yXMPzXzTR/nVro8oty/qcuYL5CIo66Q/UcQ4Kua4rxie0r4oBIVaT3oXUbOfTzlCjsDFIvW3s2o9SDqHJrtOiONFAdVZKZHBQCUmAXypgsVruSZhVVWuZtaN3WHn/1ZWN8K96KcauRJVRz1BowHGiEgrxu1WL3D8jotKAp/rXxO0R1a0wnTU3k7KuZSMmMNYo/uV8yAoAtHGOBFolmUc/GdtSIpHN+Zpjn8a0D2NY0TpIEpHdi9dnj2PFKUEC+TIWuJjS/cuTIA4nZQV/FNDWPtSA+YJC8+1N7Ny7/rNYDyhC3OLkS2Std7uKXpRiIDBLYFsev0Lsahe7RxR1W8RdcTTK70tO3m88OQTupOFFwCJY5Q35h8zBQGGhxbyooIg2wsMbdto9EN5Ir3CDAM2E60AuoIG9XKPsGddQ34C7CdDkxhOyk7JzTfYdpwgXK6gsChKO+KPhbjxGrhLlN7P+MyX0MVINM2kvpu5QdU0ADrRKMqFkPwDbovn0mlLY5RK+Wb5N8Egm+1Cbubs5hvIjeQvxtqTQ==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6284
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	31fe3fe3-d849-45dd-a25d-08d88d49c1fa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z8a1+mDJ0Md2s+Gjm9Y4SJODeVjnSG+HLDNDeiCeAFSjAyi2pa4ir4D8wAGJp2wLzStoFdrWxJZjJUJUzHLUftWVKaUA1suHP9+XfzAMXeUUVoAdZVh9YDE0TLowsF06+Bluw+TD5oPyIQaVcLtTmPnsS10p7wweMtTUZaTzaf+77rlQGbxpwDuGQRKPUcG4EcjwN9HeV2Rdzdh07/H19upXIwe67nNgutJT9wvyP6ayXNio8g5V/oijG+Nv/y1ZxiLXxYVwKuLNBoXeoTHTq4BTIqXLxrGQU1xHvX+sDzS3YnnPT5zMw29LEzfXpPemYIz6GRYZtdkVrPKZ3cKiswukeNNvrQh41dXJ5VOHYXKpd+3C5/Mq03cMuWtk79vh1+fB3MXkKrF4cdGXr+6Oqg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(376002)(396003)(46966005)(70206006)(36756003)(70586007)(8936002)(186003)(316002)(478600001)(4326008)(336012)(26005)(5660300002)(16526019)(82310400003)(8676002)(6666004)(82740400003)(2906002)(47076004)(44832011)(86362001)(83380400001)(81166007)(356005)(2616005)(956004)(6486002)(1076003)(7696005)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 11:45:26.7157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afc1ba4b-cb97-47fb-4070-08d88d49c617
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4313
Content-Type: text/plain

If xenguest image does not define some partitions,
e.g second partition definition is skipped but 1st and 3rd are present,
xenguest-manager will create second partition(with small 2MB size),
to keep user defined partition order.

Change-Id: I8ff19fd9f25eb47ac37f80bec849387f6802aba3
Issue-Id: SCM-1515
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 .../xenguest/files/xenguest-manager           | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
index eb7a3ce..edd9a89 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
@@ -248,12 +248,32 @@ function xenguest_disk_init()
     # with a : separated list defining the partition:
     # DISK_PART3="4:ext4:disk.tgz" means that partition 3 should be 4G formated
     # with ext4 and initialized with the content of disk.tgz
-    for part in $(seq 1 4); do
-        eval partdesc="\${DISK_PART${part}:-0}"
+    # Keep user defined partition order,
+    # even if previous partitions are not defined.
+    # Create 2MB partitions in this case
+    lastpart="0"
+    for partidx in $(seq 1 4); do
+        local _part="DISK_PART${partidx}"
+        if [ -n "${!_part:=}" ]; then
+            lastpart="${partidx}"
+        fi
+    done
+
+    if [ "${lastpart}" -eq "0" ]; then
+        # Nothing to be added here
+        # No partition definition found
+        return
+    fi
+
+    for part in $(seq 1 "${lastpart}"); do
+        eval partdesc="\${DISK_PART${part}:=}"
         size=$(echo ${partdesc} | sed -e "s/\(.*\):.*:.*/\1/")
         fstype=$(echo ${partdesc} | sed -e "s/.*:\(.*\):.*/\1/")
         content=$(echo ${partdesc} | sed -e "s/.*:.*:\(.*\)/\1/")
 
+        local _part="DISK_PART${part}"
+        [ -n "${!_part:=}" ] || size="2M"
+
         size=$(check_size "${size}")
         if [ -n "${size}" ] && [ "${size}" != "0M" ]; then
             # size has appended M or G suffix, let's extract just the value
-- 
2.17.1

