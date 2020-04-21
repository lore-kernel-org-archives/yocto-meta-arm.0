Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.61])
 by mx.groups.io with SMTP id smtpd.web10.4389.1587454450861282657
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Apr 2020 00:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=oDaPbMvn;
 spf=pass (domain: arm.com, ip: 40.107.22.61, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=soRye/ahH5XqsFFHB2PaPgXW1cPZp/GbNfcPW8J4YyI=;
 b=oDaPbMvnRXNLpbWQaGjqPM3s+2Y+gH1a4dh34HuOhaA7OZAVcyxz8a5eHM4OqGuQmTxyXT6J6XelMYnX6mewakhavMOCLOZnSxMZky+/u4EmqwPndt4v3r6+nEHYjUvRGLAcqTgvL7PLcUbHUItC96qiKYYgi4Gp4VwxmqBCe8o=
Received: from AM6P194CA0034.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::47)
 by DB7PR08MB3530.eurprd08.prod.outlook.com (2603:10a6:10:4a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 07:34:07 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90::4) by AM6P194CA0034.outlook.office365.com
 (2603:10a6:209:90::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Tue, 21 Apr 2020 07:34:07 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.18 via Frontend Transport; Tue, 21 Apr 2020 07:34:07 +0000
Received: ("Tessian outbound cbb03e3a1db0:v53"); Tue, 21 Apr 2020 07:34:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 51670cc403967828
X-CR-MTA-TID: 64aa7808
Received: from b20f9cf88c0e.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C92ED963-82D4-44E0-A900-2111044F61AE.1;
	Tue, 21 Apr 2020 07:34:01 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b20f9cf88c0e.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 21 Apr 2020 07:34:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MARaiy6rQws4RBHJzlaJYdkBbjwUjE2lBMqbDzDdMky11mJLuEft3c8SN0n+3NJgqi+eXTMuB9BT/u8ruw82/ex5PCVC7jE8FX6cfeI8FBzR8APB9TfAm8s9XPxrI7f9jmwbBIzx3/mEYxIOjZA4yM6OrYcQTXsUBpNeKwc6NuRSB0i7ODVF+njqNli6hMj/zu4jeQ7iGN118FXDPYlyWcX6o354mHEFNKzu9Sweoa0cFg0G9Dr6U9kLP5RhphM94NPX7PyfCd7vA4/BgH2srDRU4NMdaSdClTT8zthe8FZ/kxUWo1xNrnuEyJdNk3+x83zxuGf08/9G3DNksyzepQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=soRye/ahH5XqsFFHB2PaPgXW1cPZp/GbNfcPW8J4YyI=;
 b=iY4KdK1G3c9vsJObzzYzVorTPg4IAmANmXwAc3HL3h21yfGa/fdzK44Uz2jqaRnP7KSnueZ+4S2PcKijaggq0r8JnJ8Sw8MKsgRsrZzxvjyoiM858MLYPKrUeKBcoPFIzwwKr0B5CZohXPeLkt4lwgLo63VN/QLsagKaqd6UAuOBJsvY9+Ei9Mq8LtLQZ60TVChjIXPPKdzCaw1NDLf0nIX2vnYYAjslnKz5HPQzV+uGtHqDV1tO9nd3RMDV/Ja1+hRPV9dkMekU4hpkqFo9srW/MN/23EWG9hgIeZvia8W21UcHq4baZdh3nHxIS3HBJ1o3nmAoirAoUuVcRVMUcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=soRye/ahH5XqsFFHB2PaPgXW1cPZp/GbNfcPW8J4YyI=;
 b=oDaPbMvnRXNLpbWQaGjqPM3s+2Y+gH1a4dh34HuOhaA7OZAVcyxz8a5eHM4OqGuQmTxyXT6J6XelMYnX6mewakhavMOCLOZnSxMZky+/u4EmqwPndt4v3r6+nEHYjUvRGLAcqTgvL7PLcUbHUItC96qiKYYgi4Gp4VwxmqBCe8o=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB3890.eurprd08.prod.outlook.com (2603:10a6:208:10a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Tue, 21 Apr
 2020 07:34:00 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2921.027; Tue, 21 Apr 2020
 07:34:00 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 0/5] tf-a recipe improvements and new recipes for SCP and firmware image for Juno
Date: Tue, 21 Apr 2020 08:33:50 +0100
Message-Id: <1587454435-46370-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::31) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.53) by LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2921.29 via Frontend Transport; Tue, 21 Apr 2020 07:34:00 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ccac9511-c6ac-4bdb-ed25-08d7e5c65ff2
X-MS-TrafficTypeDiagnostic: AM0PR08MB3890:|AM0PR08MB3890:|DB7PR08MB3530:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB3530D4518FA12245BA38B88592D50@DB7PR08MB3530.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:475;OLM:475;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(5660300002)(4326008)(86362001)(6666004)(44832011)(16526019)(36756003)(478600001)(186003)(2906002)(81156014)(52116002)(66946007)(7696005)(66476007)(316002)(66556008)(8936002)(26005)(8676002)(2616005)(956004)(6486002)(6916009);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 3ku/yWfVBzitdrD+F0pXsglgwy/OLH+itxHYkmw3JF9dy7UDvT0MZoLRQvlOSLg4GnnwiVQuTJaxZSlmbnfp+knnYuLj+MO5/6bLKpze7e6J7Hrfv4S4snGUnFajOadvXVGQmeEZgWePKpfe3ItFXOd2yLg0O5NYhGZ4PHfpyL/5+hYhyVw4YXVriEVrk6hnrBQ/lBf9l0x8VUzQewVTGm1Ot0w5eDkdOl0fVfqnr5zKf+Wxy5lpCYgoyIyR4lZz/UhcsPcQP7usKFV4dbA2QauZIaWg8enoOxOQQLTZyCQiTLaN3hcfM79BsUw1TFtoMeswlruOqA7O+ytoqKtFe7GmFqXdaNCesn4EC+74+pri+IzCoA9/QUbs2fmjeiMsTQ6ZVBJmHIpR6+6M1MuBJ9+nwEvJi8vKxdtscTt9FmW/0G0njxMuioR00HafvyDn
X-MS-Exchange-AntiSpam-MessageData: 
 TbT1YXT+dJ0BplUemnFoQiTfEQ+IB9TYn83Ca6S67q1WuSMyHnHP5hZwZfxZ0QhAoJn2zYHJ8pAKYhCQaErsrGDrnO208B8E74d9cIPvJSIq0GrT+raM4CRokVoaSpPXhWxms0in6OjdfBqUadum6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3890
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966005)(356005)(8936002)(81156014)(8676002)(6916009)(6666004)(44832011)(7696005)(2616005)(4326008)(316002)(86362001)(36906005)(956004)(26005)(478600001)(16526019)(6486002)(186003)(36756003)(81166007)(2906002)(336012)(70586007)(70206006)(82740400003)(47076004)(5660300002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	67b98d0f-ebcf-48ee-2eb8-08d7e5c65bb2
X-Forefront-PRVS: 038002787A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jRxMi98TjAPUu8Jr+IfEJh6Ss5F2Nwia0paLQu1Hi4uo/ugKopT1vRVdsLVpw2dDkcv/cxg3TUPxRLMu2hQW6DgNJLx+KBG08ZkteXoNKFP26QP/Nuc7C5L+SsrYqRYCLaNA34rvTg8xPBlmYRhcpnzJiWcB7AdmNyh6ykKeh0ZKgq14Ixz7J/sdUw7Uj+4eOSbxe6Qez3js1ycyjjTx+0uJ21S6I7MD19gfQlLGSHE0g8BumLAE44M/AXoOw70gxIWZIIEZXSwNkhCQzjZAvgY1vMvazkRzyRG6QsUAviVr+V4Jo7TxT+feUKVDA/5BvzFP8jPlCkCwXs8vMYPxi1V2t8VWRWKNMdYAM2n1e6i0xeQPNP1pTRzYLXw79BqPUNy5kVTQEvQ+JVDz/2evDDXbDR5sOOCPaOyvHyvwSDGHJalz1pB0WiBJG//NyU8y1Q95SPza9NIgPTAXVnGQBjttEzfFR/hY+Dez860J9afiGzZND0Irw5ZnWPnSjSwufivnRWeYRG0wLw96Nb1UCA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 07:34:07.1635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccac9511-c6ac-4bdb-ed25-08d7e5c65ff2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3530
Content-Type: text/plain

This patch series includes:
    Removal of misbehaving do_clean task from tf-a recipe
    Change tf-a recipe to deliver compiled binaries to sysroot as well
    Introduction of scp-firmware-juno and firmware-image-juno recipes


Diego Sueiro (5):
  meta-arm-bsp:trusted-firmware-a: Remove custom do_clean task
  trusted-firmware-a: Deliver binaries artefacts to sysroot/firmware
  meta-arm-bsp: Introduce the scp-firmware-juno recipe
  meta-arm-bsp: Introduce firmware-image-juno recipe
  arm-autonomy: Append firmware-image-juno recipe to collect Xen
    binaries

 .../images/firmware-image-juno.bbappend            | 14 ++++
 .../firmware-image-juno}/images-r0.txt             |  2 +-
 .../firmware-image-juno}/images-r1.txt             |  2 +-
 .../firmware-image-juno}/images-r2.txt             |  2 +-
 .../juno => images/firmware-image-juno}/uEnv.txt   |  0
 .../trusted-firmware-a_2.%.bbappend                | 13 ----
 meta-arm-bsp/conf/machine/juno.conf                |  2 +-
 meta-arm-bsp/documentation/juno.md                 |  7 +-
 .../firmware/scp-firmware-juno_19.06.bb            | 38 ++++++++++
 .../recipes-bsp/images/firmware-image-juno.bb      | 64 +++++++++++++++++
 .../firmware-image-juno}/images-r0.txt             |  0
 .../firmware-image-juno}/images-r1.txt             |  0
 .../firmware-image-juno}/images-r2.txt             |  0
 .../juno => images/firmware-image-juno}/uEnv.txt   |  0
 .../trusted-firmware-a/trusted-firmware-a-fvp.inc  |  7 +-
 .../trusted-firmware-a/trusted-firmware-a-juno.inc | 82 +++-------------------
 .../trusted-firmware-a/trusted-firmware-a.inc      | 36 +++++-----
 17 files changed, 152 insertions(+), 117 deletions(-)
 create mode 100644 meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bbappend
 rename meta-arm-autonomy/recipes-bsp/{trusted-firmware-a/files/juno => images/firmware-image-juno}/images-r0.txt (98%)
 rename meta-arm-autonomy/recipes-bsp/{trusted-firmware-a/files/juno => images/firmware-image-juno}/images-r1.txt (98%)
 rename meta-arm-autonomy/recipes-bsp/{trusted-firmware-a/files/juno => images/firmware-image-juno}/images-r2.txt (98%)
 rename meta-arm-autonomy/recipes-bsp/{trusted-firmware-a/files/juno => images/firmware-image-juno}/uEnv.txt (100%)
 delete mode 100644 meta-arm-autonomy/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend
 create mode 100644 meta-arm-bsp/recipes-bsp/firmware/scp-firmware-juno_19.06.bb
 create mode 100644 meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
 rename meta-arm-bsp/recipes-bsp/{trusted-firmware-a/files/juno => images/firmware-image-juno}/images-r0.txt (100%)
 rename meta-arm-bsp/recipes-bsp/{trusted-firmware-a/files/juno => images/firmware-image-juno}/images-r1.txt (100%)
 rename meta-arm-bsp/recipes-bsp/{trusted-firmware-a/files/juno => images/firmware-image-juno}/images-r2.txt (100%)
 rename meta-arm-bsp/recipes-bsp/{trusted-firmware-a/files/juno => images/firmware-image-juno}/uEnv.txt (100%)

-- 
2.7.4

