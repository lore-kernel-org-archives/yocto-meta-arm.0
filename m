Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.68])
 by mx.groups.io with SMTP id smtpd.web10.50271.1597080783641144847
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Aug 2020 10:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=zkTD0AsP;
 spf=pass (domain: arm.com, ip: 40.107.21.68, mailfrom: prabin.ca@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Xu3xWSZIXnyvyj1xo7b/1yMwxBgvmQQDTv4emCTci4=;
 b=zkTD0AsPR1jldLmSoz3Ivi6hkl12pVm5ehbGbF7UFlT9vwTjAIh4ToZoc74GiW/OV8fDcCS22vHR1kIOaohDnYJ02jXYxyJMnQrJkzV0e+nnSRYwFXfsFQg12xudLubWZmyaNv6ZXPi1PNvayFh0yZREZ09Ha85KPepJTOEapFE=
Received: from DB6PR07CA0085.eurprd07.prod.outlook.com (2603:10a6:6:2b::23) by
 VI1PR08MB3968.eurprd08.prod.outlook.com (2603:10a6:803:e5::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16; Mon, 10 Aug 2020 17:33:00 +0000
Received: from DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::16) by DB6PR07CA0085.outlook.office365.com
 (2603:10a6:6:2b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.7 via Frontend
 Transport; Mon, 10 Aug 2020 17:33:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT028.mail.protection.outlook.com (10.152.20.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Mon, 10 Aug 2020 17:32:59 +0000
Received: ("Tessian outbound 7161e0c2a082:v64"); Mon, 10 Aug 2020 17:32:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c9c8b119df98a149
X-CR-MTA-TID: 64aa7808
Received: from 93320f5b95bc.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 98E384D1-0617-463C-9F34-AC480DAC67DE.1;
	Mon, 10 Aug 2020 17:32:54 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 93320f5b95bc.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 10 Aug 2020 17:32:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjudiowzvOI49mK04AlAnR7Cb1l1kEHVuZJgoCoMZTJqAC6HALdVZK8a6YFoA7cJB1kobZK5OIwNF8rtMHIrcopiVqgo5EXtZ7i/XDw//NqHBvaPU0hMztWqnZBLILQWh5JD3AKXjLFS+AX8a0a90kH75hHC0kwgWd6yEkIW/GKzalOAyHAI+mit3RQc2RJDdzUNrYDj95RzwvMsufYIcuVR+/VN7TVwF0fdakdbr0+wbgHobNMgx4l/6I+pvvUT2q8O1lnxiDHLoqszNanhUAQLA6OMAKXbk3dIS01avg1R4chAa4wyJAbg+DZoAPs29gjgjhqEu5SRXSRrcuhv6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Xu3xWSZIXnyvyj1xo7b/1yMwxBgvmQQDTv4emCTci4=;
 b=kAXV7cBRehMKC/KhRx4cpmkVfeumzOWBrGnfTq7Y9RRNvYarQc+SGyrZJ9v2nTmbqvlbyKL3uF44oRBjlhmX24GcFhm/Hpj9rRq/bAvBSwVQi5wyoiM1N2LXEDn3kD4/S4xY/KP/0mW/Sps7z2CX1gWN0ajzO4ouJY7Oe7UeL0UYuAhAZ3YNde6+qV1IuStAOAg327vfD7jPTEsVOA1PxSb1t9SwUmtQ4Nd3EKu6GFARik44q1Shutkcwna+xYHN9NWEY/R0mRHzbRY+I2eyxYD4W4Bkw8AmGEY8wsH6GjrYv03eXbh6xC/lvUPoVGiqr1DZ33gSJS1yPkRcG4LwdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Xu3xWSZIXnyvyj1xo7b/1yMwxBgvmQQDTv4emCTci4=;
 b=zkTD0AsPR1jldLmSoz3Ivi6hkl12pVm5ehbGbF7UFlT9vwTjAIh4ToZoc74GiW/OV8fDcCS22vHR1kIOaohDnYJ02jXYxyJMnQrJkzV0e+nnSRYwFXfsFQg12xudLubWZmyaNv6ZXPi1PNvayFh0yZREZ09Ha85KPepJTOEapFE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM4PR08MB2756.eurprd08.prod.outlook.com (2603:10a6:205:c::33)
 by AM0PR08MB5409.eurprd08.prod.outlook.com (2603:10a6:208:183::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Mon, 10 Aug
 2020 17:32:54 +0000
Received: from AM4PR08MB2756.eurprd08.prod.outlook.com
 ([fe80::6cc3:86b5:f5b3:89d5]) by AM4PR08MB2756.eurprd08.prod.outlook.com
 ([fe80::6cc3:86b5:f5b3:89d5%7]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 17:32:54 +0000
From: "Prabin CA" <prabin.ca@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Prabin CA <prabin.ca@arm.com>
Subject: [PATCH 4/7] arm-bsp/grub: Add grub-efi support for SGI575
Date: Mon, 10 Aug 2020 23:02:13 +0530
Message-ID: <20200810173216.10411-4-prabin.ca@arm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200810173216.10411-1-prabin.ca@arm.com>
References: <20200810173216.10411-1-prabin.ca@arm.com>
X-ClientProxiedBy: BMXPR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::25) To AM4PR08MB2756.eurprd08.prod.outlook.com
 (2603:10a6:205:c::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from a076760.blr.arm.com (217.140.105.53) by BMXPR01CA0015.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Mon, 10 Aug 2020 17:32:52 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [217.140.105.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4b17ce49-073e-476d-8095-08d83d536d58
X-MS-TrafficTypeDiagnostic: AM0PR08MB5409:|VI1PR08MB3968:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB39687925065A43C2BF0493E2E1440@VI1PR08MB3968.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: PEnNMZcDV9rPfsBHg4q6zAxzVhrNHcFIwBjjs7aWQc85im/VBqD/opS7DjURY9YC2lfoboaV8Qwhhz6jgeT2/Z/mx9BH+iFOWB/243rbrgwPaFeYrEldRORkzFS3+Ng0cna4FaP83tA2SWk4xPV5Bvf6pIyal+aR0O+T8HoggEp1gYUVI+wN8KnQMkL0Vmo37SYkiOWTGGOnip9ex8ZS2D9ftub4UhjSATVJ/FVA3WBDoPz0MQJLly8hXf3BK6eDxw203l37A8xvCnBxwJQOlybAhYTQfvGE+QJWlKZfpzutFsL9GN4HDKwvJ5JyHlS9otCwXQW0yt7kYkFLBG47ug==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR08MB2756.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(8936002)(66476007)(66556008)(66946007)(6666004)(26005)(6916009)(36756003)(52116002)(7696005)(2906002)(86362001)(1076003)(316002)(956004)(2616005)(4744005)(5660300002)(4326008)(8676002)(16526019)(186003)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: e7EcSad5nDmA9RSZ+UVL6PSi4hIUJpLOKqttvuNMnkBBKML3c575I2LrPqmlwe1jtAZ3nwskpLYHy138MBzWIMa6iGGgRi8xE8TxkSsL4ZyT7oSb/pejQEdL2riq2TkGDvT34GZwmC0xsPRKkRpI/Gj1Jl+GSm20V7GlIoIioK3yepCLm2UKLLMfl2RxAjpt+HUAcGja6XslBFG5H/KmyLayIN0EELWEHFWWlVSweLOXdwNafTeUR3dXBotFJIQ8U6+AEhCyMMF1B3Frn3VHCA7Np/Hadi/rhkVlL7zeoX9Tf0o5itHUeYu+cS6RylAnOYiHfWsvHLNniOjcx+TdWYrx76MQr5YayQa1YALQqE+v3hMGbpGTKC4CnfMZO5aK9jvlY5rZWJ+Gz4lm3Qe5t+w4dTpteIQdSTGv8vHWjBIjlod6GZKI0GwJG0jRmtXhlFi8wL3lljGjO+7eeOrHT+HiE43H2V8cmCs7VK7E/9ZWs/WvQgyJjBhOhd620vKlKo1ONF4T4qtHJWessFi8eQDVo0GUNRghEr0Bxgt6gyhvAm3yii4PN1O60Az2TKX2Ivx2FHODMl3mihz72M7Fqa4rkH5rwNATXVD0Q2lxLfIaG9NemRqxm05cN57sZs5Jhm8sl9moAzQNNxcKSNnT9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5409
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Prabin.CA@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	435e37f5-86c5-44ae-575c-08d83d536991
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FkTkbW1Yuow/xL3RKjDTtK0yB+b5ddJ3BSnN3pB6kO5CrLmzVjxuqI+TmHc+7yAlkgxd1ujXh9mHDJX9oT8jY7MF7Hl1uKhnW2ioL7MAbERhiDHct/rOtumhwDQcoStIR7gpafmkafsxJrZvqYc4DQNF0SdXHQUesVczac3vHTnhE7h8N3+9ghKxozWRyxb7HkD1EUctTBuUi7yO1GuFyWxbN/XYkYvVOGkwGYqB9Yp1UrNHUeBr4vbCEpDEmnxwhvg4UnRBffIBWHJyerAtOx7ed0/6FV+GC0WNt7u6qkkTbGDoso1FKrATZvW+AQpl/alnBEFlchhnJH427DQa1559yx9d/3jQMPvoNjhYiLE3g26Mj0afVYeT5KvXkgRvbMwtMUqskcDQjnyowqV0cA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(46966005)(4326008)(7696005)(5660300002)(70586007)(70206006)(86362001)(356005)(47076004)(336012)(82310400002)(956004)(6486002)(2616005)(81166007)(316002)(82740400003)(6916009)(186003)(2906002)(1076003)(4744005)(16526019)(26005)(6666004)(8936002)(478600001)(8676002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 17:32:59.8961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b17ce49-073e-476d-8095-08d83d536d58
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3968
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

grub-mkimage is used make a bootable image of GRUB,
grub-efi dependency in added to conf file.

Change-Id: I3afde13902cf396c47fd3ddea01d09cafd2a996d
Signed-off-by: Prabin CA <prabin.ca@arm.com>
---
 meta-arm-bsp/conf/machine/sgi575.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/mach=
ine/sgi575.conf
index 719d99e..da4f2af 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -21,3 +21,7 @@ KERNEL_IMAGETYPE ?=3D "Image"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-stable"
 PREFERRED_VERSION_linux-stable ?=3D "5.7%"
 SERIAL_CONSOLES =3D "115200;ttyAMA0"
+
+#grub-efi
+EFI_PROVIDER ?=3D "grub-efi"
+MACHINE_FEATURES +=3D "efi"
--=20
2.28.0

