Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.54])
 by mx.groups.io with SMTP id smtpd.web10.5473.1605193320974581426
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 07:02:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=GJf9ApyE;
 spf=pass (domain: arm.com, ip: 40.107.6.54, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHuZtq65RFkKMNLOfzHCAyVLNEMP9W4TtTt7ju0r5sA=;
 b=GJf9ApyEHrThz72CwKTau5dYyAD65jqeb6xSkn2RVS158yDH0O+akDlX5lXyby42CK4MODl4/lVCSwqFGNlQYZT6O5Vh+J2Z/FZt+rlo4f4ulU56d99QTuHpLFjQzrNe/sPEvm3ahidUwW5C7OdC4et8QRjMo/o1n5hCmiHbMHk=
Received: from AM6PR05CA0026.eurprd05.prod.outlook.com (2603:10a6:20b:2e::39)
 by AM6PR08MB4771.eurprd08.prod.outlook.com (2603:10a6:20b:c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Thu, 12 Nov
 2020 15:01:58 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::73) by AM6PR05CA0026.outlook.office365.com
 (2603:10a6:20b:2e::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Thu, 12 Nov 2020 15:01:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Thu, 12 Nov 2020 15:01:58 +0000
Received: ("Tessian outbound e0cdfd2b0406:v71"); Thu, 12 Nov 2020 15:01:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 311ae0a6d57e1d11
X-CR-MTA-TID: 64aa7808
Received: from c47941e04a92.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 41951BAD-B1BA-4010-8FD0-531D4834C739.1;
	Thu, 12 Nov 2020 15:01:52 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c47941e04a92.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 12 Nov 2020 15:01:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFnDOhTIG2U9BglXPElUkuyDpmka24X1JYCBBUBUSAvIo1LUS6DJBWzf9J0B3Hp7aSMSNUGZVIqL6ePp8FkCbD6u9ysTW+xzVowSnqiUdnZioQHHeqpvtSsm6fE/3g9ty3yINtUq9xpPzjI+wLOaHTNVvLCL218vXxE0au/yrDQW0AlffKR3GHeOLvnvU4Y6ofyl8a1vOTRFv8EoaIT/ITV6qbJ5i2oXzI/o498QdWNaxRt5rHQrOW6EsvM/EuQGgK7EbVE6ATWT1XKjZKHFqPdXD24jTGMkbI09gmsERZP/KH4VLGylvy39MKpyP8SMAGzTNo+H0xWUmAua9JBIHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHuZtq65RFkKMNLOfzHCAyVLNEMP9W4TtTt7ju0r5sA=;
 b=Dij0fET7N/1a6G4GdZb+MujJ4B8dRfSUwMA9qcIabqS33JD7jq4nTDuDmRJ/geAcL4dGlvwwAnJ1yFwIAijGBXrlj9tK6riGVZX8bcIE26qAJW+c1kaPFOUtBh7/79pC4c36FY4KGfrfB/DpUORSM5ezx1XpqCseJVyp69J7bnEfv6GfR7tokDAYEocmFIb/k6qNDCcVXDy/zPNhOUm2CzJyMGh8NYpAFf5Eph6CmgFmEO/yVrXB7zjhawUFqNRu85eg3XIn8kKweUsxrVdeEHgFWpYSxZiTVva92hq6NyZMdl3X29MK0PIi3Sv1qIf26L009cmzK+SZVYRkl4BYjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHuZtq65RFkKMNLOfzHCAyVLNEMP9W4TtTt7ju0r5sA=;
 b=GJf9ApyEHrThz72CwKTau5dYyAD65jqeb6xSkn2RVS158yDH0O+akDlX5lXyby42CK4MODl4/lVCSwqFGNlQYZT6O5Vh+J2Z/FZt+rlo4f4ulU56d99QTuHpLFjQzrNe/sPEvm3ahidUwW5C7OdC4et8QRjMo/o1n5hCmiHbMHk=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18)
 by AM0PR08MB3411.eurprd08.prod.outlook.com (2603:10a6:208:dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Thu, 12 Nov
 2020 15:01:51 +0000
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::105e:371d:a567:a068]) by AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::105e:371d:a567:a068%7]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 15:01:51 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm-bsp/n1sdp: remove swap parition entry from wic image
Date: Thu, 12 Nov 2020 20:31:38 +0530
Message-Id: <20201112150138.30489-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.105.55]
X-ClientProxiedBy: BMXPR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:c::15) To AM0PR08MB3409.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.105.55) by BMXPR01CA0029.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:c::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 15:01:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 74ab7613-d0bc-4905-2237-08d8871be6f9
X-MS-TrafficTypeDiagnostic: AM0PR08MB3411:|AM6PR08MB4771:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB47710211622C9591477AB7CBFAE70@AM6PR08MB4771.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 B2bddilHO3bBmwBeb/cUG1F1K25ysbee1YMUnYOdlMXZio9YGbSS48RD46YO62Roi8Ljvtps1lP+Boxr/CNpz7mEokNzyYA/8ozS2R3/tAZM50Xp3cYx3fO4fGonQ9daY3xnn7GSRBsyVNgh1gZn2btrMOOGrScYac+xmtna9xoYaS32T8O6MizuOFJZrfWKqZEujkL5nA0ULmITciO46h9f3JOexy7AwWIN3cwhOD4c4xPrGrs60Q4SECSBLgjup5l7pWlk8/+SWUdFlCFdfaQQZcI5XbkiTVEes6ruRk495xM9RaBgZks9HsqNGiNx5U9d8g9sNGYLDB/FOELr4c7ICS10HLlrJHc8tI2TWSwyzzMVCxe3u0wemc8WnhGGi1s2lEG1hKX4qM/O4FOZmg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3409.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(1076003)(478600001)(956004)(83380400001)(36756003)(6486002)(8936002)(316002)(4326008)(4744005)(8676002)(26005)(186003)(52116002)(6916009)(7696005)(66556008)(66946007)(5660300002)(16526019)(66476007)(86362001)(2906002)(2616005)(6666004)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Gps2VQlARJMOH//fyBy5GcbsyaFXfff8rF7kqHb9CZU8kHFMquXmdGa1PE8U+R6aD0V6sdN9J8sdim/KZAWsH6CM2ix10CS/HmqoC4URKB9l6567yfAK6DA4U63d+/DkzSXiQld6lKR+yrs4InlrqUOUSAt3+czSrBR7Z80WI0yVmp+Kt2YGXfXBdF3bmBT2+v8basYQgeauf0rtjlb2X2D0c43sUhL0+DqSlt33JKuQJlUbd51nmZPw6I2lMaJ6X0ZejptEzDAZ/Edu+d5h4V313nCmlCx9h1p4iAwedAAEnlPNMIz5rp4WnBNXfX3mMF/DdrotXuPg3OKaWePcVVdCovEMzF9XNBmOd3NxdD8c2HYeZ4qU50r2WhidwGzTR0rn8ynahwHWBIlGbKS210gZJOOyyPiRpaZ11PS+yTEtoZkXy3kee15+KgIimST1fKbp2SSXkvIWbhw7gW/Ukg4je+Pyo+/jcSsZH8aOj6IR6NlKoQqxV9YU6jSGqA3AumEnssFhPMHgo+KtEsoLNfnkgQ2l2AY1VkdaSedlEBwzJPhI9UX8Kqx/5yyX5OfJYKjXX3syWBptmCkdkjlUG8HDHTxIG6CBQXD/PJf/PavmQS84Z76vMcEJlWtU2NF35udWvtSFnkoZRQcfDeqrYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3411
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e80e1f6d-6284-4305-9114-08d8871be2c1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PAVe8OnFXa7AssvMGrgkzWCLhcUJcRm6hbSt33UId3YkXIljB0M/qmXDbrx3onM2TiXEu1k0gTJbrEq+2vqY6mcK4Q/kamP7NmigcUQbcZXU0Xs1GrnREQ+nDYEaMoZNOKcURS535jPjZxyxKZu1rA6RH2+mljBkj4aNrjL9Se+ACOwJoUoceOZmqXbfJmIAG/JihGQVxDpLM7WvjFPonvnZ2W95RIGa/GZFhMe0FzhQ6LOHnJ1+41nPNYqXmdH6lbhBF6xGjb0BdR64C8AHxlTLgIHpCCl2BBUmmhiSQDvfA1Kxp5Frt8T8NeZPdEU/qgcuGkpCFmY2iO7fIPIyCzW6fwSFsHdeMmU8/ro2TajQKhPf+Dk8u7F04MC8/mNljtj6Qkyo+0Fy0P7NBR6DMoHCJRB/YrHk69iQJiuveKUS4cez12QoKOr6pyqEGpJdP5yYDBY6LuzBf4KgAlqDKg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(46966005)(6486002)(356005)(336012)(956004)(316002)(70586007)(5660300002)(82310400003)(6916009)(2616005)(2906002)(16526019)(186003)(83380400001)(36756003)(86362001)(6666004)(1076003)(4744005)(70206006)(7696005)(82740400003)(81166007)(47076004)(8676002)(4326008)(36906005)(8936002)(26005)(478600001)(473944003)(414714003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 15:01:58.1339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ab7613-d0bc-4905-2237-08d8871be6f9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4771
Content-Type: text/plain

The swap partition on n1sdp seem to create an issue when shutdown or reboot is run
from the shell prompt, the console stops at "Deactivating swap ...". Hence
removing the swap partition entry from wic image.

Change-Id: I22cf971fdde7e3b8b386c74003983fab3d309cc5
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm-bsp/wic/n1sdp-efidisk.wks | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arm-bsp/wic/n1sdp-efidisk.wks b/meta-arm-bsp/wic/n1sdp-efidisk.wks
index d1ebfb8..b131dd8 100644
--- a/meta-arm-bsp/wic/n1sdp-efidisk.wks
+++ b/meta-arm-bsp/wic/n1sdp-efidisk.wks
@@ -6,6 +6,4 @@ part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --ondisk sda --
 
 part / --source rootfs --ondisk sda --fstype=ext4 --label root --align 1024 --uuid=6a60524d-061d-454a-bfd1-38989910eccd
 
-part swap --ondisk sda --size 44 --label swap1 --fstype=swap
-
 bootloader --ptable gpt --configfile="n1sdp-grub.cfg" --timeout=5
-- 
2.17.1

