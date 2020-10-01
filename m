Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.66])
 by mx.groups.io with SMTP id smtpd.web11.2531.1601568429723308758
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 01 Oct 2020 09:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=uhVCIzJ/;
 spf=pass (domain: arm.com, ip: 40.107.20.66, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XiJBYzrXSV4Gjm8nYjsKjusTYMNLuxmQ4WNqk6nBKSg=;
 b=uhVCIzJ/K72/gkBYBS2GbbZJ6k0QeZWSojLa9KxnOJaAfO7Bqb1g+bT6dtrc8VuHEUXMn4E9PmQ39SfAR+x/PmNX07xNbHI1SPaKkX8Vbk9pqDh0GALfWTfoNH+lX2IXB54D2xdvebgMfwO8PqLjMvcBbA4cqY1lBf/GTEtjVfs=
Received: from AM7PR04CA0010.eurprd04.prod.outlook.com (2603:10a6:20b:110::20)
 by HE1PR0801MB1931.eurprd08.prod.outlook.com (2603:10a6:3:4b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21; Thu, 1 Oct
 2020 16:07:06 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::96) by AM7PR04CA0010.outlook.office365.com
 (2603:10a6:20b:110::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38 via Frontend
 Transport; Thu, 1 Oct 2020 16:07:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Thu, 1 Oct 2020 16:07:05 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64"); Thu, 01 Oct 2020 16:07:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 51454d7299495f5a
X-CR-MTA-TID: 64aa7808
Received: from d4579213680d.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5FFF12B3-39B4-46EF-9C71-E43E5117B3E9.1;
	Thu, 01 Oct 2020 16:06:57 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d4579213680d.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 01 Oct 2020 16:06:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLlfclhba9jPCqJAeQlgbIRNH3EFwGridUSJA8hHJkI+7TgLuxKsCNbSUMlTjxUFNKUNZeBK4OpCZyUn/mAsAy2X2cd3ygxxjTd9zQxuV0G232W+6jx4Vjg2lQ4MkuQ8oDKgTnOIyrDhyZYF5CaW6dGiCY1zw3VgTUCQ9l7Pa+pnS1DeDjL8NLi//uKu5cEMqPd1bwVbrL0x5O42wXPb7slIhrZPsC9UxWoGVG6SId5+6m6DEWFqebanr7EXkO+y2TVYyM6hwuiKCk+FAEdKwzyGX3UHh480IdB31lBPsXUaU02144e2fH4n/BFLHDT5qpXL1kEL0nqvnxA0HA6Jqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XiJBYzrXSV4Gjm8nYjsKjusTYMNLuxmQ4WNqk6nBKSg=;
 b=jC3FeS2tZjmdeQDo+T4nB1E+kd3ohzPQaoSh+1Vd3+WaYOH70igKlBWSVViJATCmqnhsZ1A0ml/WzsooCfdwt+H2F9HPDVk/4EDpzzCyFSM9U/eYNmbR332ms4bVT4+zS8Z8FsAVxzUQQfh3PwSWRZxp6NLAEELqPRlH4Rz9vwYmyqJGcM6GKb4nETP3o/w8NyZ9CAMlHXsrBc7nuNA/n91gDk5lQzgMvqXTUV8iYg9M6SFjGfoidx0eQjUt+Jx13sMcKAsSVm9arQddRyuo4jxpSBJNng6CXi2qQmcbIAb0VcJibB9GVECNMzYGvin/ZQMews2XqLNGbPm3QFkGGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XiJBYzrXSV4Gjm8nYjsKjusTYMNLuxmQ4WNqk6nBKSg=;
 b=uhVCIzJ/K72/gkBYBS2GbbZJ6k0QeZWSojLa9KxnOJaAfO7Bqb1g+bT6dtrc8VuHEUXMn4E9PmQ39SfAR+x/PmNX07xNbHI1SPaKkX8Vbk9pqDh0GALfWTfoNH+lX2IXB54D2xdvebgMfwO8PqLjMvcBbA4cqY1lBf/GTEtjVfs=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3559.eurprd08.prod.outlook.com (2603:10a6:20b:48::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Thu, 1 Oct
 2020 16:06:55 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3412.028; Thu, 1 Oct 2020
 16:06:55 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 1/2] arm-autonomy/grub-efi: Add xen_boot support when 'xen' is in DISTRO_FEATURES
Date: Thu,  1 Oct 2020 17:06:49 +0100
Message-Id: <f01f29dba132ba93d6fc85f87257f2a581b1ee98.1601568289.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LNXP265CA0072.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::36) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.55) by LNXP265CA0072.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5d::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3433.34 via Frontend Transport; Thu, 1 Oct 2020 16:06:54 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 75115cea-28e5-4a9c-f6b4-08d866240acf
X-MS-TrafficTypeDiagnostic: AM6PR08MB3559:|HE1PR0801MB1931:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB193105BFBF87311BB4352CAC92300@HE1PR0801MB1931.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:296;OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 wMjTevViMT8BzOCesPE7ls8Cfgoi0TQARzB9eDis1cYrgr3ePdY2RhuDa3Q1G1kNoyeP9DOnd88KJmmXdodAnPEMdUhl3GUcim8hTFuPt70/QaOdNw9gXygDMykuxdxTlHju8Hxx6jMCoKEZZH4GmCxPQykrcauWVjlSBcVmRzd3F2/3VZqy7nvETHCRZA5blztoqLukUZaybSVG0E7h7ytek6g449mvzMknrYjuXYP2VXYRF/c4fzBeCEbXAX8VQizQsGnWvsHFELI5SVGXeLRzos6mXBhQhfzNWegDcyqsNowKONwRiXFxMzp5ChPyBnE09rEht0UIlqSY1yFvhw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39850400004)(376002)(396003)(346002)(4326008)(2906002)(2616005)(8676002)(8936002)(956004)(6486002)(478600001)(86362001)(316002)(44832011)(6666004)(7696005)(26005)(36756003)(52116002)(16526019)(186003)(66556008)(5660300002)(6916009)(66946007)(66476007)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 5YkdJ1PcpgqMx8l0EnFzFl0MoCUswJ4mWwJTI4JwoCakkYmSbyuqPNJadQDvTlLKdmCdd4XXfSG4YkvFkglSbW8p7dkhEy23LEK4I59DGqLY5eMIpUElpZzuj0eCW9Gt4h94RPCAMESHhtxHKlmGr/b0kx9ZTa1kz61dY0c6K852J6dK2vcDLUroBOpkwDYgoejE1G0QWoRzHi4QHDiRIIwrOnBQJASrs2q/ekuKHoRInB4f2lBq4Sp+fIA1/8+ApNXAmd/+GNXDHG3rA29VWgi5A5ZPLOX7jKYWtcj4lZ0i8tvcghONhn4B7LhvdQvdiWtwnGaINiLzkmgN/+6yz6men5B0t4WwqustgULV/+7fu6WA6VGgA+yo6PaNMCwfkjuiYdzDDXoig0l6lqEcbM3EKqzxu0F/JpkxxZqi6n3v0Oe8EVpbNSixNGDvqRsy0In3WWJtfmFMFE2XnXaomt6dSaRsEkS9eHmXCY98EDqfIoJQLA2z+DIqeQeyqC5Qe3fw/0g8gODV4hsqdwUfRK5UmdVKy/IUHljK1/758HcREQQLBWqv667vDEN4GJRpUgk6HmCGI7U22DgdybJlUvKySc0lgZBpluI/jVbxRzQ8Q99eTS1o5yM2ChW17VRhIAJQ2u40qYL35VTAPon8tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3559
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d6111006-32dd-4864-5177-08d86624044c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2wmZzzmid3AcfG9XJ01jASYhsBRTj+CthfGke3vdSPmahjcikHF7KZrcOE8+XNpFdyV7OpqiuUlAaJ+gfFFTY/R+xzNI7irsoOsJU+T2j/ibvnrQ1ggkuL8gPYQXPuBW4UlZjrZ15zk+n22nJ5Pxa4iL/trgngto/1+Vk3LE52nUaO7iccj+oSL4LYzEZvnx0gogrU1CZRhkgDgtOosC1GJyhBFz1wVUPNk5M2CeM1RP3pxxDAD+KJZCWXu/8Cnn7qYVlDg95IcOcrSp6+8wjfPZnV93U+7DDmMu63mIrPWiRaLC1IBHFer0feiVuuuSPnTLTZF7htPmJFfi0cLX5OrkFJWNDzjq19ll0cUCzB1DdY6nxZnpfiz/nA6Vvawo3a77AdjtwaMURlLjlXPA2UXCLy7+iuv7f6LHugCRVG+afnkIXfFFp954pIv/WrR0
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39850400004)(136003)(346002)(46966005)(8676002)(36756003)(5660300002)(70206006)(70586007)(16526019)(8936002)(6916009)(186003)(26005)(316002)(6486002)(36906005)(44832011)(86362001)(6666004)(2906002)(4744005)(336012)(478600001)(7696005)(4326008)(956004)(2616005)(82310400003)(82740400003)(81166007)(47076004)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2020 16:07:05.8488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75115cea-28e5-4a9c-f6b4-08d866240acf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1931
Content-Type: text/plain

Change-Id: Icb9d909beae96e3915f36093c1c16859181d0238
Issue-Id: SCM-1065
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend

diff --git a/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend b/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend
new file mode 100644
index 0000000..6d60011
--- /dev/null
+++ b/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend
@@ -0,0 +1 @@
+GRUB_BUILDIN += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'xen_boot', '', d)}"
-- 
2.7.4

