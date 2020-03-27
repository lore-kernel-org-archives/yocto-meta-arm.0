Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.56])
 by mx.groups.io with SMTP id smtpd.web10.8820.1585306256709105220
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 03:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=DkQOBMB5;
 spf=pass (domain: arm.com, ip: 40.107.1.56, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBbOvXY09du6fg4Crg0hC69AkNxDphhfq/OiVvtx9Bc=;
 b=DkQOBMB5b9bIfCy1jOJgtjcUYtKea1JNNM8veoX7IALSgEAtq0ce3ohDcgJhrRNGTnjrsGDc0pO33r8BpZO58xrJgT2qr4acyXWYBIY33TfTfb0cJSiVU51RtdTTjWUlbK6Koruoo37Ljh48eGE5LQIzPj+KdEut1Uz7h9Js6X4=
Received: from DB8PR03CA0025.eurprd03.prod.outlook.com (2603:10a6:10:be::38)
 by AM7PR08MB5415.eurprd08.prod.outlook.com (2603:10a6:20b:10d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20; Fri, 27 Mar
 2020 10:50:54 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::91) by DB8PR03CA0025.outlook.office365.com
 (2603:10a6:10:be::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend
 Transport; Fri, 27 Mar 2020 10:50:54 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT018.mail.protection.outlook.com (10.152.20.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 10:50:54 +0000
Received: ("Tessian outbound d6b3ed9fc62a:v48"); Fri, 27 Mar 2020 10:50:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 90e6f58c9fb84033
X-CR-MTA-TID: 64aa7808
Received: from 902c0daefe6b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8B7E8D28-8F96-4CFC-A171-9DE71DC9387B.1;
	Fri, 27 Mar 2020 10:50:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 902c0daefe6b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 10:50:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6UKu8/L3QxVrP3qTItHGc9OU7A4Hj/zPeH/95AxXXGJPy9wRDCpDLIIHN/wB8/YdRPY53dB0Wz1Pr+4/UWhctpHMrofb/T0y2u25wjr0Wu4F12bJNRSE34GS/r7QKDkEB4fGLXqSOcNhXwbtIkA5lqNa2SZLACgiwXalkI6TiOSbsWqGZnsT+BP0zPvZWQqU1WZtW13CC/l58OTPueIINsZCqxpdGVrvBpGb1CXtG/korVUzcPczuhNWzYNrWmvn6Uoh+0NYGrZQM+F1ESs8PTCylqnCsmgEqMid80XYAi/oH2qZxQe27gBrlZUl3yHTdoIr6xKk4TQ2nCp1yq/Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBbOvXY09du6fg4Crg0hC69AkNxDphhfq/OiVvtx9Bc=;
 b=im0rnyikSv5VQ5LKhS5Fjij+2eaY6qp6CL9LGMQjgUWkgTq+2X5tAP8Kwn/EapnVkvU+3ao9JBuSJH0LkVsjZuUdgj+KPBmDDCee3y0Vivj6uc/61nTksiAKS4M8j6Ic8IM0dJUhjr4qtvIuAXltYQYAG00WfERCQ6e1zUQgAMClEcJYJBd0ynH7Uo5m7Eh+a27t5MqOOybay1c8KuH/xRk2oiwPHXfFGE6AmCVL160vx+0o1jhFoAlcSdUrP9neGzK63kDTu/KNUbda7L2TLcvdsKAVZSUmXPgfccWy5BxWWQLQVkpgbez/T1JGKNDW/6AiVSXW71a7SiaobOVMOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBbOvXY09du6fg4Crg0hC69AkNxDphhfq/OiVvtx9Bc=;
 b=DkQOBMB5b9bIfCy1jOJgtjcUYtKea1JNNM8veoX7IALSgEAtq0ce3ohDcgJhrRNGTnjrsGDc0pO33r8BpZO58xrJgT2qr4acyXWYBIY33TfTfb0cJSiVU51RtdTTjWUlbK6Koruoo37Ljh48eGE5LQIzPj+KdEut1Uz7h9Js6X4=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3450.eurprd08.prod.outlook.com (20.176.238.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 10:50:47 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2835.025; Fri, 27 Mar 2020
 10:50:47 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 6/7] arm-autonomy: Create quick start documentation
Date: Fri, 27 Mar 2020 10:50:09 +0000
Message-Id: <20200327105010.400-7-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327105010.400-1-bertrand.marquis@arm.com>
References: <20200327105010.400-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: DM6PR12CA0036.namprd12.prod.outlook.com
 (2603:10b6:5:1c0::49) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.50) by DM6PR12CA0036.namprd12.prod.outlook.com (2603:10b6:5:1c0::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend Transport; Fri, 27 Mar 2020 10:50:46 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ced6f09f-5cea-4696-4d5d-08d7d23cb917
X-MS-TrafficTypeDiagnostic: DB7PR08MB3450:|AM7PR08MB5415:
X-Microsoft-Antispam-PRVS: 
	<AM7PR08MB54154B6F1E69DE5700AD18CD9DCC0@AM7PR08MB5415.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-Forefront-PRVS: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(86362001)(6666004)(5660300002)(6486002)(4326008)(44832011)(956004)(2616005)(16526019)(478600001)(7696005)(81156014)(8676002)(66946007)(36756003)(26005)(1076003)(316002)(2906002)(186003)(6916009)(66556008)(66476007)(52116002)(81166006)(8936002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 sl7zjfjJA3ILMaE+qAVX/zjWwtbmFtcZodtT2DblMs/TbIc1u6PSLWUjisc9826mrD94VFJFrtFbUpk8ypZi5ckYnTuc7KjuZ4VaaB3BpHKx01N5aYHyDtlGVRhQdqqL8cp4qzUStaMXOvQXehA8Hy2Md2z4rrnq8ephq+9WPBw9d46EIrI8bZ4wrRsVrxDiSvn25FbApb3I/aCOOUJSD/uY9nO9oeV910A1C1sudT7dXvWc5YcwKNi67bqEr6atfttW6y5A1rtdU/75GINuzWZOunjYWnaOIguc7ZZn8UBDoQLKwm95QL3P2qjdqM4HvJEafO0ljRoKJa40k++cKAxiY7hvg0ZmbfqLF6a/XU6sGA87yaoKodXk6kbJIsuhmT83q14Cp1YfHC8ZosvL9/YnW6QWMIHIVVAiW29XJHuQccnuc+bsH9yXPueEwPhqaxhd3axrj9RdlZi6ycJ94JVu82nz1VOmkbRnXrRCwbqj6YOrtNpF8Mf1TKZffayv1G6CdOs/j0wzja05GBgS8MDji1i1nRXThBVILvDmEYTO8r5jHGY4T78Dgm/zib+sbTyxrqgq1s/nBSSXGp7k1h5MCSESPPDn4rPZAa2tMbErEDvlY+rABjfuZOgclPFYoKnHfo3fP+vEjS2HiO76PVT4FwrkdHpbUaBq1Y4ZKEi4NlXPaRrgEYa0Jxn1XOjm4bgMEXDtwDY5O51z/kkQLA==
X-MS-Exchange-AntiSpam-MessageData: 
 KoccDiAmHMRlpjJj8SjaDGzKyAoTubRmDWLBgTngUMd57XAoJIDJ0wMQDjK0B14jaoChN0p2zFNqtAMTtgj5EdIcOWTE9JhDIynKGeXJl4bK8NqCabavuxva4LPFjTdhk4iSv8jHhT3ljFDxiNpY6g==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3450
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(39860400002)(396003)(346002)(376002)(136003)(46966005)(70206006)(5660300002)(1076003)(6666004)(26826003)(316002)(356004)(70586007)(4326008)(2906002)(47076004)(336012)(82740400003)(36756003)(26005)(6916009)(478600001)(6486002)(44832011)(956004)(81156014)(81166006)(8676002)(8936002)(186003)(2616005)(7696005)(16526019)(86362001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d2fead93-e456-492d-66b4-08d7d23cb526
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hkXoc8jyAuohMCkopAyA+uuEYut1IXetG2O6SlmQ8nIKmWcgk3aLwt00yhn1+9/89pjmTmljNKen18gDAfqlJjZdkO3rCPc29Ul3SfGPg4GyaIMEcA6oNg50mNq4p2kRTOUyFaeimtuLQ9urNJpPU6+WXxMAuIVQMoLbejTJTtokpf+IJteORqzAW2yj1EJTFQc55bat5h6mFBluFbZMN+pdxqkp5RGV64supeOJUdSsxntNgoEex+KBgvCD4VaBUDOcfZphbrG9gzBAuef4Uc6z46meLu4jVgpftQbhfEYzTDbFCZ82oWDRCQ11GEuWWdMSftaA1waNFfcbOMbCx1A5nTbHotXLEKqrWHjv31S7PXmo9ggwrsTgDy2IDjCCceGDudC5HJ58Fm490txcVoSjaN6AxRODAYgW4gKYlhBy2ZFpoXnxcIFb9YwYC9QMlD5uaHUai7G8SBDZ/HqKvTqGFBRzs9AwRnDHQC8Y6gqE4ToLLRaeoRpBkvYP9Pc4tzU2LnZx7FU9AWqNy/2dWEdV2bR6LmDJxVrMiGT3PeQXjj57BJGtwDarHqhz/AV7w58QtBN54GTSbPFGZ/p9knPO6TnB8/K+O7pEc5OVBlRAf5wTqEqYdyvpvkyNBXnScBDg4y9y0wpO0F6OWtY55sIcuwNzB2lNs4/8QZPKBjtD785CVEWDkAlsiHqgY4ui5RNLYepHgWZGORZlQXewxntyT4Y9uOtNiSlSbKja4t3UGOVJFRWnXGZJV163OK1anXX36qBboGmtEwjbXbTBZlZZj+8IEIA/1kMm6exd0vg=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 10:50:54.1327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ced6f09f-5cea-4696-4d5d-08d7d23cb917
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5415
Content-Type: text/plain

Add a quick start documentation to help user to start using the layer.

Change-Id: I3aea950d2dfdcae41bbdb8f3df4f29196048338b
Issue-Id: SCM-767
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 meta-arm-autonomy/README.md                   |   3 +
 .../documentation/arm-autonomy-quickstart.md  | 116 ++++++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 meta-arm-autonomy/documentation/arm-autonomy-quickstart.md

diff --git a/meta-arm-autonomy/README.md b/meta-arm-autonomy/README.md
index ed9d6c9..9b12993 100644
--- a/meta-arm-autonomy/README.md
+++ b/meta-arm-autonomy/README.md
@@ -7,6 +7,9 @@ This layer provides an hypervisor based solution (currently based on Xen) for
 autonomous system. It contains recipes and classes to build host and guests
 systems.
 
+To start using this layer, please check the
+[Quick Start Guide](documentation/arm-autonomy-quickstart.md).
+
 Dependencies
 ------------
 This layer depends on several other Yocto layers:
diff --git a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
new file mode 100644
index 0000000..2b92996
--- /dev/null
+++ b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
@@ -0,0 +1,116 @@
+arm-autonomy Quick Start
+==================
+
+This documentation is explaining how to quickly start with arm-autonomy layer
+and the main features provided.
+You will find in the documentation directory some more detailed documentation
+for each of the functionalites provided by this layer.
+
+What to use this layer for?
+---------------------------
+Using this layer, you can easily and rapidly create a system based on Xen with
+one or more guests created using Yocto.
+
+For this you will need to create at least 2 Yocto projects:
+- a host project: This one will compile Xen and create a Linux system to be
+  used as Xen Dom0. The Linux system will contain all functionalities required
+  to start and manage guests.
+- one or several guest projects: Those will create Linux systems with the
+  required Linux kernel configuration to run as Xen DomU.
+
+Prepare your system
+-------------------
+
+First you must download the Yocto layers needed:
+ - [meta-openembedded](https://git.openembedded.org/meta-openembedded)
+ - [poky](https://git.yoctoproject.org/poky)
+ - [meta-virtualization](https://git.yoctoproject.org/meta-virtualization)
+ - [meta-arm](https://git.yoctoproject.org/meta-arm)
+ - all other layers you might want to use
+
+For each of the downloaded layer make sure you checkout the release of Yocto
+you want to use (for example zeus using `git checkout zeus`).
+
+Please follow [Yocto documentation](https://www.yoctoproject.org/docs/latest/brief-yoctoprojectqs/brief-yoctoprojectqs.html)
+in order to have the required dependencies.
+
+
+Create a project
+----------------
+
+Here are the main steps to create an arm-autonomy project:
+
+1. create a new Yocto project using `oe-init-build-env` in a new directory:
+  ```
+  oe-init-build-env my-project
+  ```
+
+2. edit the file `conf/bblayers.conf` and add `meta-arm/meta-arm-autonomy`
+  layer to the list of layers of your project. Also add any other layers you
+  might need (for example `meta-arm/meta-arm-bsp` and `meta-arm/meta-arm` to
+  use Arm boards like Juno or FVP emulator).
+  For example:
+  ```
+  BBLAYERS ?= " \
+    /home/user/arm-autonomy/poky/meta \
+    /home/user/arm-autonomy/poky/meta-poky \
+    /home/user/arm-autonomy/poky/meta-yocto-bsp \
+    /home/user/arm-autonomy/meta-openembedded/meta-oe \
+    /home/user/arm-autonomy/meta-openembedded/meta-python \
+    /home/user/arm-autonomy/meta-openembedded/meta-filesystems \
+    /home/user/arm-autonomy/meta-openembedded/meta-networking \
+    /home/user/arm-autonomy/meta-arm/meta-arm \
+    /home/user/arm-autonomy/meta-arm/meta-arm-bsp \
+    /home/user/arm-autonomy/meta-virtualization \
+    /home/user/arm-autonomy/meta-arm/meta-arm-autonomy \
+    "
+  ```
+
+Those steps will have to be done for each project you will have to create.
+
+Host project
+------------
+The host project will build Xen and the Dom0 Linux. It will be the only project
+that will be specific to the board (MACHINE) you will be running on.
+
+To create a host project:
+1. Follow the steps of "Create a project"
+
+2. Add the layers in `bblayers.conf` required to build a Yocto project for the
+   board you want to use.
+   For example to use Arm FVP Base emulator, add `meta-arm/meta-arm` and
+   `meta-arm/meta-arm-bsp`.
+
+3. edit conf/local.conf to add `arm-autonomy-host` to the DISTRO_FEATURES and
+   set MACHINE to the board you want to use.
+   For example, add the following lines:
+  ```
+  MACHINE = "fvp-base"
+  DISTRO_FEATURES += "arm-autonomy-host"
+  ```
+
+4. build the image using `bitbake arm-autonomy-host-image-minimal`
+
+Guest project
+-------------
+The guest projects are not target specific and will use a Yocto MACHINE defined
+in meta-arm-autonomy to include only the Linux configuration required to run
+a xen guest.
+
+To create a guest project:
+
+1. Follow the steps of "Create a project"
+
+2. Optionaly add layers required to build the image and features you need.
+
+3. edit conf/local.conf to add `arm-autonomy-guest` to the DISTRO_FEATURES and
+   set MACHINE to `arm64-autonomy-guest`:
+  ```
+  MACHINE = "arm64-autonomy-guest"
+  DISTRO_FEATURES += "arm-autonomy-guest"
+  ```
+
+4. build the image you want.
+   For example `bitbake core-image-minimal`
+
+
-- 
2.17.1

