Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.75])
 by mx.groups.io with SMTP id smtpd.web10.12150.1592810105355866819
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Jun 2020 00:15:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=g76r168B;
 spf=pass (domain: arm.com, ip: 40.107.6.75, mailfrom: gabor.abonyi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCcJg8voOMxbPUSU6FrVZJTF0KxuaW78vjgHSuZjS6I=;
 b=g76r168B5UjsFEyuCEBEmzbIm6LQLVr4HvJzrEepbZrvNb9nhWau6cNTsxjuIfwdATzCE73lzm3Mmu/EzpCoPvsXhwiy0u9FHVeEVg0LgmPUtUtxlGAHSJMpdJYGd9tu4sT4MP8hgzVzjc+22Er45XIGKenT5DczESdriqF799E=
Received: from DB8PR06CA0050.eurprd06.prod.outlook.com (2603:10a6:10:120::24)
 by DB6PR08MB2837.eurprd08.prod.outlook.com (2603:10a6:6:19::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Mon, 22 Jun
 2020 07:15:03 +0000
Received: from DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::e7) by DB8PR06CA0050.outlook.office365.com
 (2603:10a6:10:120::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Mon, 22 Jun 2020 07:15:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT059.mail.protection.outlook.com (10.152.21.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 07:15:03 +0000
Received: ("Tessian outbound 8fb20e43acb7:v59"); Mon, 22 Jun 2020 07:15:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7159ba876040a518
X-CR-MTA-TID: 64aa7808
Received: from ed8fc317142e.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 701A9BA6-4932-498D-B881-99E7A09C9E50.1;
	Mon, 22 Jun 2020 07:14:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ed8fc317142e.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 22 Jun 2020 07:14:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=curbulnedbbhPxugkIM6y5CeXk8xW/j217yMO5Uim+T5aWTWLHDFF0rAHlh3XKooLU2YEr2mx9Z0zb+iKafiJ449MNO5GqMalUxuvdbdAx8ZlfBH1spmjrX4/rK3Vj0c82dSCrxjJKDEwqekA6l0cY7YIp46d5hEhokAgGa22bwCLEbONEoLzWn2GPMC9PfOSL3JJDXpQ3Ay00Mn7NzdPz8fVYfJhTjojByiOpoXY6Xgx/pLZS1N78GOnIPC3JQ4W6oGtTgU+t3W5RR/eO55Z8KcpB6F2bQYShTGHaRVrFQlj95ob+045Fd5WJBRTqdK6bliBvqjfPNDm33YAT+LRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCcJg8voOMxbPUSU6FrVZJTF0KxuaW78vjgHSuZjS6I=;
 b=dOVSJHkSSIbwSYtfiZusg4b2eFFe72HbTyKxBSkyPuhKIViZ8akg6JtbrXBoXrOzju01Ig5P4AP2WOkHJUC0bQHLfKeBU6Rmh30bCF4+Mrr49Cy+lbYt4K8bX2qnknuojL4lmQmH48IcpSL/Sk7TQRqOWE64y9qCOHx8dLLqmXTYtLjDm8eRn0WcUYYaiWzzHaruF53SGdaJAIXIJBzBdsinfzMQWD5bzgCrS02Uz/AXRGmSl3TCq5EAxJTdU61fvWENc00dgmcXKgbvmGkIyRyOLBS1GirnMb7e6PQS/fmM3p8Pxg9T5pFTPsdS25igteJDiISlPPtPDfzMWr6cyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCcJg8voOMxbPUSU6FrVZJTF0KxuaW78vjgHSuZjS6I=;
 b=g76r168B5UjsFEyuCEBEmzbIm6LQLVr4HvJzrEepbZrvNb9nhWau6cNTsxjuIfwdATzCE73lzm3Mmu/EzpCoPvsXhwiy0u9FHVeEVg0LgmPUtUtxlGAHSJMpdJYGd9tu4sT4MP8hgzVzjc+22Er45XIGKenT5DczESdriqF799E=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22) by VI1PR0802MB2606.eurprd08.prod.outlook.com
 (2603:10a6:800:bb::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 07:14:56 +0000
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::f019:f39b:c062:719c]) by VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::f019:f39b:c062:719c%11]) with mapi id 15.20.3109.027; Mon, 22 Jun
 2020 07:14:56 +0000
From: "Gabor Abonyi" <gabor.abonyi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Gabor Abonyi <gabor.abonyi@arm.com>
Subject: [PATCH 3/6] arm: python3-cbor: Add recipe
Date: Mon, 22 Jun 2020 09:13:58 +0200
Message-Id: <20200622071401.2570-4-gabor.abonyi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200622071401.2570-1-gabor.abonyi@arm.com>
References: <20200622071401.2570-1-gabor.abonyi@arm.com>
X-ClientProxiedBy: SN4PR0201CA0004.namprd02.prod.outlook.com
 (2603:10b6:803:2b::14) To VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from gabor-VirtualBox.arm.com (217.140.99.251) by SN4PR0201CA0004.namprd02.prod.outlook.com (2603:10b6:803:2b::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 07:14:54 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2d41caca-af0f-4bdf-c60e-08d8167bfba2
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2606:|DB6PR08MB2837:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR08MB2837795DD1B1033919BBB49C8E970@DB6PR08MB2837.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;OLM:2089;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 vP+rwKOqxwQZyE1+6lyHsPlYq/Ko3qnweeDjL7VraU2QCD6HGH47fzVs12dIwHqFhLym5sFd3ECkPpOUd+vSV1TTeECsYS0BHGYT1JwgaPgzr+Xtvksa8t45xzQKgbQQq4LFSVlYgq04xmBGROzLpgJL0El2c89VQDMwZ5DBGcaw+ralU6/WpZjGYzoAWKKb+CZJrN0t4iQeBAE6ORqn5o4A6+1xe/cxdDasKpfO7/VYmXcMgiV7SdA0gFf5Yl0oYktGmRIHNh1fZG8fPbilo1w0RFdWh0Q1xjAebZq7bz1XM8n6lHmcCFY/K5dr+/UdP/z4Rs/jwiE0+Wr9QerJULTjMPC4z2advKuYlL8lXDT8V/jsSzKuFrU4bInnkEUmmuwzz8UV6jU9gVRALVKYTA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0802MB2414.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39850400004)(346002)(376002)(366004)(136003)(1076003)(316002)(2906002)(86362001)(478600001)(2616005)(44832011)(66476007)(66556008)(66946007)(6486002)(5660300002)(956004)(26005)(16526019)(8936002)(186003)(8676002)(52116002)(6916009)(7696005)(4326008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 A5S+QWXODsO03eIMUqbn9PrmYWAHzGoudgUtIjlK/70UPXGcCvkhFB8zVya4LUc6akcupF9LXylyxMrgQlHWWCUZ60MkRHScoxvE+Ib7TBmXZ04q+Rs4qRTBAqVAsHrf+mdjnrmUEPo2qO6184bXt/FchS1pfvGY+9Oi57a3ZXvah50M+bbOuxt1g8+EcuUcojDDiCVsIAIEsC10NdYNwgtB6BTMz5n4P9NoOouImbG9vEkNzm++OFMIFAMzh1MCn+AQRL5ecYI+qWlw5L/WymURpBE5sTtDYpavmhYbYxd+9RtMJEHGterBWESvcJGpYtRWeAAyAVbv2Tb14IHL4o8weoLEHFuBikWvQ0MOy5/sOpTbStLkyhj8sxtSsAH3rqpb89KFCQRz0aCXPOf69hHjMyx/NWIV+HqOXFBB3w/pJaA+Q7VNmQWV6EhyGnKMgSdew7ztSeE+xgsy3/6JJNUq++rHao9uNaVnuB+R1yiuJykmER0wNB/fSycICNr4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2606
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Gabor.Abonyi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39850400004)(136003)(346002)(396003)(376002)(46966005)(70586007)(1076003)(186003)(16526019)(6486002)(2906002)(336012)(86362001)(26005)(5660300002)(7696005)(82310400002)(4326008)(36756003)(44832011)(316002)(70206006)(81166007)(356005)(8676002)(8936002)(956004)(2616005)(478600001)(6916009)(82740400003)(47076004);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a892c76f-5ed9-40df-1ac8-08d8167bf760
X-Forefront-PRVS: 0442E569BC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	naLdThLQv7lmwFFESmqZYLXmOnlZgeGHByLbjEnIzIWbfbtaUFuIgPXkWj33zpSRZkmNpxY1CvsI+feDC3kKujBe0l53rzvzwWyNJ7o1rUt5gNmxUXRvUGxEQHHfHy2Oc+2xPIXp/HteEVYymG5ZLQaaMWJmP88/f/0WmD72PjlMtk7Xh19MNkkhYa8s8St0Ko8HC0Pp9dFjIvWu70YlW7Knn2i/4s4aGWFRFZ89ONsTrtxdtqUToTCOkbhsKGKz0vMz/LGIGUTco2Y0Td+Pi5+n03A9xaE/j55FpLYjb7JOgVEE0tsVJ3yydl3PhklvVeE9JeQWDeecHFnlfda+IpzOaKf67/Nx/VOPdPn+zuAb2O+OeiamRWA0qRIkwkWXWZ0AMNGHGmkbv8PrbwtS1FA7UbsRHkHK/EeL2N5NOetq2+Aq/+kIAXbwqhz+6HwgZP8Iyl8lYJdNaWcaki+VzxnVUdjiUzg2YuVPvbhtyQM=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 07:15:03.1382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d41caca-af0f-4bdf-c60e-08d8167bfba2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2837
Content-Type: text/plain

Adds a recipe to pull cbor pypi package for python3.
This package is required to compile Trusted Firmware M.

Change-Id: I86ef64a573e3daafb1b798800c4a0c05b292078f
Signed-off-by: Gabor Abonyi <gabor.abonyi@arm.com>
---
 .../recipes-devtools/python/python3-cbor_1.0.0.bb  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/python/python3-cbor_1.0.0.bb

diff --git a/meta-arm/recipes-devtools/python/python3-cbor_1.0.0.bb b/meta-arm/recipes-devtools/python/python3-cbor_1.0.0.bb
new file mode 100644
index 0000000..7c529f3
--- /dev/null
+++ b/meta-arm/recipes-devtools/python/python3-cbor_1.0.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "An implementation of RFC 7049 - Concise Binary Object Representation (CBOR)."
+HOMEPAGE = "https://github.com/brianolson/cbor_py"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
+
+SRC_URI[md5sum] = "22b03b59784fd78cb6c27aa498af0db6"
+SRC_URI[sha256sum] = "13225a262ddf5615cbd9fd55a76a0d53069d18b07d2e9f19c39e6acb8609bbb6"
+
+PYPI_PACKAGE = "cbor"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

