Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.62])
 by mx.groups.io with SMTP id smtpd.web11.5767.1598322764845593516
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 19:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=JsfCqHs6;
 spf=pass (domain: arm.com, ip: 40.107.20.62, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwnC9ZfS8fpPVTUEDT2EvQnKHLVWiBm/DJCbFZsh2lg=;
 b=JsfCqHs6ISUamdS966Hf+D8UTVWzrHelB/0lUWxWzmFk71+mirZOeYgENPAhFMr7u+SsO91L11BI+DMhrFCktB1ltfwzSGuOuz4/fHXbQWfvp17uxRlfEftUTOGdbqPQRYnWLl5fNQB3W/oTC4JY+1h8tmMBkRHbv82FOTgXCug=
Received: from DB6PR0802CA0035.eurprd08.prod.outlook.com (2603:10a6:4:a3::21)
 by AM4PR08MB2644.eurprd08.prod.outlook.com (2603:10a6:205:c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 02:32:42 +0000
Received: from DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::64) by DB6PR0802CA0035.outlook.office365.com
 (2603:10a6:4:a3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Tue, 25 Aug 2020 02:32:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT050.mail.protection.outlook.com (10.152.21.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 02:32:42 +0000
Received: ("Tessian outbound 7161e0c2a082:v64"); Tue, 25 Aug 2020 02:32:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ae08fcfa164dd389
X-CR-MTA-TID: 64aa7808
Received: from aaabce501ce6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 71247F7C-A9BC-4827-8D5E-6D571136284C.1;
	Tue, 25 Aug 2020 02:32:36 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aaabce501ce6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 25 Aug 2020 02:32:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVuuXgSaI4AMcefkodtNqRQwbwcTVf2Oa07m5SSHRlhgxISjqWIVr64aKKK8ibKxEOEWrCOTBOq0Yn+PNyHI/5vpr7AKX6OIpb6MjhTJyrCzjFmGYOm2nmEVIgPcrf+e6O5MW05f8SO3qiKAxMck2uFCjOu70IOMiWdHL4XfhanwfoapcCo60cX6cKXTfhMLOfPefaO9P8bDaOuRLunSZgBy2GJrxxWrINU4qktkjgDgZ6Znib+Boj1JRk/uvR2dlXy3xT9V6ndihw3jjkFmUMXNXV9uvK1hTE3mohtfF+bfloXRKtqvgy/v5B+R7N846kuo6ZauxIDy2XsL0sidhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwnC9ZfS8fpPVTUEDT2EvQnKHLVWiBm/DJCbFZsh2lg=;
 b=GKmBXtGwjAjuHO4APDHMcZdM4d1MQ8tnQtdUssTLSUl0MnlXjMLQskNyoJ+6Pu6h6O/q9zIV65ddnP4atf7wIAPBk9+iRk/QyfXeld9IPaEc8HderO0fVHETUb/k3doJB7uSraeIzCgXvO1TN6yJaTDYd+vQQ3Zw0W8Fw4BVfXkGmoB7fLxr+FkiG3ZwZNszD2fJgHApN15RnerUVhbnv5DYJoDj0sp/qaMwgkbc9UqygbSVItyHoOD4X2HaDgjDnecxi6EyAVOK5qOxLCq8o4dD6POlSJlF6aFAO5Viv+GgV8YIoQr+soAsGfvTqBqHWlMKImu9Qh36vyMsSiDQ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwnC9ZfS8fpPVTUEDT2EvQnKHLVWiBm/DJCbFZsh2lg=;
 b=JsfCqHs6ISUamdS966Hf+D8UTVWzrHelB/0lUWxWzmFk71+mirZOeYgENPAhFMr7u+SsO91L11BI+DMhrFCktB1ltfwzSGuOuz4/fHXbQWfvp17uxRlfEftUTOGdbqPQRYnWLl5fNQB3W/oTC4JY+1h8tmMBkRHbv82FOTgXCug=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
 by AM4PR0802MB2259.eurprd08.prod.outlook.com (2603:10a6:200:5e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 02:32:34 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::4970:ca13:3555:891f]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::4970:ca13:3555:891f%3]) with mapi id 15.20.3305.031; Tue, 25 Aug 2020
 02:32:33 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp: redundant entry in FVP TF-A
Date: Mon, 24 Aug 2020 22:32:20 -0400
Message-Id: <20200825023220.27193-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825023220.27193-1-jon.mason@arm.com>
References: <20200825023220.27193-1-jon.mason@arm.com>
X-ClientProxiedBy: DM3PR11CA0013.namprd11.prod.outlook.com
 (2603:10b6:0:54::23) To AM0PR08MB3972.eurprd08.prod.outlook.com
 (2603:10a6:208:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (136.56.1.171) by DM3PR11CA0013.namprd11.prod.outlook.com (2603:10b6:0:54::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend Transport; Tue, 25 Aug 2020 02:32:31 +0000
Received: by vm (sSMTP sendmail emulation); Mon, 24 Aug 2020 22:32:27 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [136.56.1.171]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c777cb91-f5af-4350-3dd7-08d8489f2481
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2259:|AM4PR08MB2644:
X-Microsoft-Antispam-PRVS: 
	<AM4PR08MB26446FB77C3BE105461C3B89F0570@AM4PR08MB2644.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 S8qhLOhx1NRmpIH9/fjwWoAq5XTLHTlzjgjtbyszzCrE/CHg8JmgjL4dAwtuBld8MdKCJ8fUfWGmQAbCBspEH9HfrlVc2/Eo5XAxAjUNR20SqmxmfwMZSFS8MPRogkb9v+fO/gSYMwaT6hX6DWijFrEUlQY1oQfrXpubokslSWlRQR+aMB2M3jannHlxHjlOOTPl27E/XuJUnvANWPAdvKuThCU+qcRWYurmJxgE56vKMCvvOZAk+uswg0qM8HqCEyXOJSgVS2oREZc7z9qUcFWWWvH0FQHnZ7RdJRcHJoPk2LPFPRdKNGMud1q5ndggGfXOLwme6EcT/SS+QTnlfg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3972.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(44832011)(42186006)(426003)(36756003)(316002)(478600001)(2616005)(52116002)(26005)(83380400001)(86362001)(186003)(6666004)(66946007)(66476007)(66556008)(1076003)(8676002)(6916009)(8936002)(4326008)(2906002)(4744005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 zEw8cFu7F7R1iWtTIyg7a48UtU6Cr66ssyPdNTmQToQiT7addAukJHk1IlmktnO0MPo9P6gYVrXxmjv2d/hGiCBUdRTHS7OjjEMnQNBWjA0e75+2vBeRzso3wHDBjfPci5+Y+LtLtBU1++hAb1fx3acjfz6NGCUTXHGxTMt/B8Z75sHoBoFocpS3WItkwx5Vcnm8+JntgW68OxZiJbDFpwMgcsOZddhOhbM5ZsTktLBQ0lh0i/yRASmNsoRLjYtRdTPSSPd3B06zf2t8G4ewr8+dM1Izd6B91R5gYNJN5B2omm5tKWg5dB/lMMi+teVB20+v5Ttmrpk3VdDQVEmj9s/1qHjRqpQDR2tKICiICjalLrXaNoC9YkBL2iONV8/rZ8r9t+nw3ra9NgvtbRVKSb4sZiZXju6we1YMQMqBWkcGiRwYfTqiBxD9sb9M9q20808lyFQGwcFzplBirCJp6zpR37FdSGdFyz/5q1NsaWfc0lzXvwss/IN/gcKtycZW038kpXqho1OV/nPxvRu/8FbFz+RAX4rdmwJn1TrrC+uWezs0dwHSQ1pFLkI+yvUUJvmE36P+lj/SIBmM8xuxQWDH+KUKELMHLJeGuvDZ7VTYfWBcKTflcaOWngJfWbqYnQM1ZvJaabQuykWlAeIy3g==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2259
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c929f08f-5936-4dae-57dc-08d8489f1eb8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IP0JunKoDyJjZmZ6RRf5H4cy8O9tCKxLHqA3ThpjTcad8x17zZ9Df4oALbpZvC9XpqZ8hkFJ8H2mZv2q79AiHCvZ00QC0VWuo1y6TwdQm816ZMnoPNHd0oE5MzT/cz2+THJjnxZlzkVJxBz5GGYRMkXP5ackb48ph1w+ut+WOY4V19mBPa5Mltz7C2iusyhA6eMg1sgD3Mglzom+pz4h1K5VUb1mDlCatGTCc6AJBc1xGv9IMw/DDIew/bXyOw7zmrAPduJNduAzGjVuZMlAkuKscnAmCtpAlioAvoJFq2kym6uhGTSZFZcHDjcYjJ1qGKwC/VqWGJxCrZWz68WgKgfb7D5xa+3DnmfCNblv9bncIn4a9iyx6yt67itULoS3lKPirnAQROsakftMacupxA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(39860400002)(46966005)(5660300002)(6666004)(70586007)(70206006)(82740400003)(83380400001)(81166007)(1076003)(316002)(356005)(82310400002)(36756003)(478600001)(4744005)(47076004)(86362001)(186003)(2906002)(6916009)(42186006)(336012)(426003)(44832011)(8676002)(2616005)(4326008)(8936002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 02:32:42.2314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c777cb91-f5af-4350-3dd7-08d8489f2481
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2644
Content-Type: text/plain

bl1 is specified twice in the FVP Arm32 include file, which seems
erroneous.

Change-Id: Ib2fc91b547151acfc28f57679e99f649bd0f49ab
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc
index 5684802..117c25f 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc
@@ -3,7 +3,7 @@
 COMPATIBLE_MACHINE = "fvp-base-arm32"
 TFA_PLATFORM = "fvp"
 TFA_UBOOT = "1"
-TFA_BUILD_TARGET = "dtbs bl1 bl1 bl32 fip"
+TFA_BUILD_TARGET = "dtbs bl1 bl32 fip"
 
 EXTRA_OEMAKE_append = " \
     ARCH=aarch32 \
-- 
2.17.1

