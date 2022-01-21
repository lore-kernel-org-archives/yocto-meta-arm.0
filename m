Return-Path: <arunachalam.ganapathy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C59C433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 11:57:16 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.80])
 by mx.groups.io with SMTP id smtpd.web08.10771.1642766234051470416
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Jan 2022 03:57:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=wAepr0c6;
 spf=pass (domain: arm.com, ip: 40.107.8.80,
 mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Mu5/fw3TeN6h3DjxLqhBa49o0XJqhytQxJvZqwzQZo=;
 b=wAepr0c6bcKaIrH3tA/1/zQHSSfBtGXH1iALJGHtgqHy8wk/UXVqkqeR6/zLx66aDt3ET5uuEYDsQTP3DYKupX0My9us9Mo7SILpu/pZLB/6ZnrOiZXBzNUpigNRrgk/P9Jk4FQJseU7HRtNKjSbmFb1huJ7zjstYdRbw1AK/FA=
Received: from AS9PR06CA0180.eurprd06.prod.outlook.com (2603:10a6:20b:45c::27)
 by AM4PR08MB2899.eurprd08.prod.outlook.com (2603:10a6:205:c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 11:57:10 +0000
Received: from AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::d7) by AS9PR06CA0180.outlook.office365.com
 (2603:10a6:20b:45c::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Fri, 21 Jan 2022 11:57:10 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT040.mail.protection.outlook.com (10.152.17.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.7 via Frontend Transport; Fri, 21 Jan 2022 11:57:09 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Fri, 21 Jan 2022 11:57:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dda04f2791b9a8bb
X-CR-MTA-TID: 64aa7808
Received: from 15c3cff1ecc4.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1723687E-8058-490D-93B0-4DD20821519A.1;
	Fri, 21 Jan 2022 11:57:02 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 15c3cff1ecc4.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 21 Jan 2022 11:57:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fedEIlPYNXt1i6KDV03HRP8XQEWnkdbuSSfXKDROgPR7UDRakIFU7u6MqNruUgoHMyK3Rrzyjvjv8uDULZD2h28QbKp5vl1390NxOpYUXxqP4Q4YGwcXKmHa6BHqrP7P/tg2EwmVkRJ7+8LnO7RGlvyZ5A5sc1giE3fViqaoe/9EhrDKEhT9aO004id4R0A7cJ9JC/aGhmXc5mgU3q1bwD8ORj3vHox7PwWpDcgxBXqyVktjxFVKw1Vzra+KDh/JwfVYfcF0stLbh4aDDnjJJSERMrsMG6ICQk/zb64wAnJTYmWR/G/mp2pbKxMvKmYPZgYYbJGyVjHd2aMeZiLNiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Mu5/fw3TeN6h3DjxLqhBa49o0XJqhytQxJvZqwzQZo=;
 b=FwZAn33+F/ZDmXglaYoXZ3JsUQKOkRtVbwAMI9NuRKgq1hF5750SquksjVW2CLsBWJ+ZvXJIOPqrNcDzgRDpJsu0Q/TzGaVbhxE7jdd5QHnt+dk5wMzac+btUhx6G64f2S/NonV4No0Xu720Sw/yCiB0CRuyHgFc+RI7O0fgsFuCwgs19I5AXCHAI0t1Y2oqR3t9zI61An7u5UY2iwTnRn5q+kWTPyutYFNa+TfdRqp2i7bQh/kseSBKeawhVCEJrcSrhFkxD9i/4M0k6QpHhsCbFT88TsoLRt5zjF3HZXScBPdIBK134bO5m36TZhVO6yAlJiyaojGVR2xiynIl6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Mu5/fw3TeN6h3DjxLqhBa49o0XJqhytQxJvZqwzQZo=;
 b=wAepr0c6bcKaIrH3tA/1/zQHSSfBtGXH1iALJGHtgqHy8wk/UXVqkqeR6/zLx66aDt3ET5uuEYDsQTP3DYKupX0My9us9Mo7SILpu/pZLB/6ZnrOiZXBzNUpigNRrgk/P9Jk4FQJseU7HRtNKjSbmFb1huJ7zjstYdRbw1AK/FA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com (2603:10a6:102:136::18)
 by AM0PR08MB3075.eurprd08.prod.outlook.com (2603:10a6:208:5a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Fri, 21 Jan
 2022 11:57:01 +0000
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::4416:49a8:fb0c:6bf3]) by PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::4416:49a8:fb0c:6bf3%5]) with mapi id 15.20.4909.010; Fri, 21 Jan 2022
 11:57:01 +0000
From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 2/3] arm-bsp: Set preferred u-boot version to 2021.10 for TC
Date: Fri, 21 Jan 2022 11:56:42 +0000
Message-ID: <20220121115643.485616-2-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220121115643.485616-1-arunachalam.ganapathy@arm.com>
References: <20220121115643.485616-1-arunachalam.ganapathy@arm.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::16) To PAXPR08MB6766.eurprd08.prod.outlook.com
 (2603:10a6:102:136::18)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: ceb0e607-0c68-4b02-4ab4-08d9dcd52762
X-MS-TrafficTypeDiagnostic: 
	AM0PR08MB3075:EE_|AM5EUR03FT040:EE_|AM4PR08MB2899:EE_
X-Microsoft-Antispam-PRVS: 
	<AM4PR08MB28995D151A8FB5A5D5673715FB5B9@AM4PR08MB2899.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:27;OLM:27;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 x7/E3cTa4OWa8dvWkhCUMiNiLU2HYMldM9sgG0+AO/OoLQsZuVaPllUs81USPNOkRjRIwd5Gf8PNKxwpJ6AMd+smlk2mHVsimfKlLDTQSW6rJPRKVehRXG/zrDWMmOvbbN5bouWQZv3rGNBOaAZpULqzSEsC8DMUY8M+j9pUHF5HtQeZKf5Mwoz2P7tnybYjT700tFrZeG4qBS9Eo018AVN9RVCFaWuJX3U4Jfi9bYrFkBTho+0Q0JMtOCkq6HwlI8s7EP4Mcns1IQtSr0Y6bzxeYDqXaHUT3bvhrcZyC1faF22oEUaXinSLDNJs2Hzn7GHj17eprl/OyT+Tc3MEe4gBuUNEB3VKApAxQ1N3swYwtfUtqzWF3p1njYlOlLw4P+DvCa1RVjw4BMUl8RNA2VgnKYw9CgRxXZFJKkCGb1ZMQqzR6ACUsSgTh+xGGlHGaQ67F+Y9jz5jpys0oAe59b7Qir8s6TrT3KbK3BZwf+PrDhKDPyovrrxEvcGBW04orggwDyGj4InMEQ1+ZorzepMhqr37Ayew8+nFBS8H5Rnr5VXbWlY8pu4SxRllKfG9OCgFf/CNaKu+Us7uc5tKzmQPwPWN3Wrp6khaL8O2hbTfH+RnHaG5rjyxDhdEBjSEfLpz8DD9LpM6vSAZbr0men2a5/7IQfDWqZ04W/RzV5mxZmm7Q5bwzSOzdpdENsU5GCXNmenWpNtxo53HCPTuXQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6766.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(44832011)(86362001)(186003)(26005)(6506007)(6916009)(1076003)(36756003)(8676002)(4744005)(508600001)(52116002)(8936002)(6666004)(2906002)(5660300002)(316002)(6486002)(6512007)(66556008)(66476007)(66946007)(4326008)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3075
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	439a3209-eb0b-4aaa-ac79-08d9dcd5224e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vlTgwFFEhQn+J4qWZI4ELMMZDlKAnO0go68PaLyjU7Y8j9bm5yQa9C5pl6vC7KdB0RV+6Zr0sqIyHFjiWQBQbpEuHKtCALXirJIw2KWNhxNzzuXgyqchahbfwMAQI4rMkhhiAhZEJZgyruXAbgWyAQsacrjgODmX629wrQcvXsG5BfwT0P18bvCUQdCcgROdGgWahjMnb3BKwXI2LAZiAZfn/CkRNlbbMQyGRLRHhL7qjhjdA3TlKAyb0pz742BDV8PksWswSUCGDgdT9ftnUuoTyTwDwq3XXFGVTn3cZvyTWFJXLekQhUfm0Qn/Vj0FdtlY8uuPptAjHkV9WeUG1+CZx5l6/wmh0QutX+Wi7NgEuxxrWc3LN9fVPDxYiw8sWdY2L2C4KnWqy5dBaekYIaXPrYTn7ywaW52dhm9TI1vVEddRkjVPOQtWia8RrLmRY+lyv7Tr6Lu9DjEP2uA9vb/91Z6iAFNdrLRiWmyYlMyTxx2kk95gZpKxbZlZztl6wiPzOOYwaDQZ9H7fw7zAk7Kf//EuaAvmKZA8cbLR6aTr88dHzCHhb+pMpMuiMRY5ydrKuaNfxe/zutb2PSnFdtaGeUD7VayFrUaIzeEjs9kKF5UyPpzM/uzZRiIILl0nZ0t9tkwM0LGE0uaE0RrdyNg375pS3cw2WHlIUpAyOqP75lvCiRLVG43QVedBNh/wJsNvxkpr/0A1EC5EVRekCw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(44832011)(4744005)(63370400001)(336012)(8936002)(63350400001)(4326008)(5660300002)(6512007)(47076005)(82310400004)(81166007)(356005)(36860700001)(6666004)(70206006)(26005)(316002)(70586007)(2616005)(6506007)(1076003)(508600001)(186003)(86362001)(2906002)(8676002)(6486002)(6916009)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 11:57:09.5908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ceb0e607-0c68-4b02-4ab4-08d9dcd52762
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2899
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Jan 2022 11:57:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2888

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: I1c814cdbcff158f70910cafb4cbd0656271acaef
---
 meta-arm-bsp/conf/machine/include/tc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/conf/machine/include/tc.inc b/meta-arm-bsp/conf/m=
achine/include/tc.inc
index abdbfd3..71cb17c 100644
--- a/meta-arm-bsp/conf/machine/include/tc.inc
+++ b/meta-arm-bsp/conf/machine/include/tc.inc
@@ -6,6 +6,7 @@ MACHINEOVERRIDES =3D. "tc:"
=20
 # Das U-boot
 UBOOT_MACHINE ?=3D "total_compute_defconfig"
+PREFERRED_VERSION_u-boot ?=3D "2021.10"
 UBOOT_RD_LOADADDRESS =3D "0x88000000"
 UBOOT_RD_ENTRYPOINT =3D "0x88000000"
 UBOOT_LOADADDRESS =3D "0x80080000"
--=20
2.30.2


