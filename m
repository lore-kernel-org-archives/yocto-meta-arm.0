Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C945FF8855
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 13:19:16 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18126.1778073551572109754
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 May 2026 06:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=jbcsNSri;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.54, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8b6ea7716bfso44538766d6.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 06 May 2026 06:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1778073550; x=1778678350; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2MItVqC5feO6zUcPnFqZz5USVo4gxXadvBGiH8UOsM0=;
        b=jbcsNSriO5Av3gEK7NvaRkGj+zRDZ+pcvHG87JpletI6UoL0/9nkcFQB9m2hhKytJi
         A6K/bSAYjrLEJWseCz7ihHdl25oGav4/xlobBiw3gOtrR/WoPVB0Z16d5zU04HN7O/lp
         xEORSY78/TMI8MG170Wl1OTMZjldoGTS657NjNxFk12YqclCp5ybbGI6qA28ADX0Gfb6
         uz0QpsxLReeGmLckypSwX3QTlvDMxWsR7jZCmdb8XAoYdsIb4Zbab/D0n+mXx3gWVa7i
         CSGVD6h3CE/yhz4B74w7/40gM1SKe4sPxzK5EVAYgNy4KRPGuA2OwFSBZ3dzKaeqK0ZB
         QbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778073550; x=1778678350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2MItVqC5feO6zUcPnFqZz5USVo4gxXadvBGiH8UOsM0=;
        b=EJEJ36BmrdZRv9D3zBjbIldTq9ra9FU3wMbhhGmaQn3lN3neRhU8fd6k4R1tdYK4TY
         i3BYN/Tvq94YvY1J+8S14bTiio3maNe2ppURSZPRqggqXf9ayMrS9N8DM0xWMp63JTBO
         eZwVgeaWZ9pymza7ESPb20nCreTECSN1J1Z0t8pZTr6SV1CPLvhMxsWtXqNRuqYzghfb
         ienPFkl/OmMy/50ZKvvh/8AUlpBhMQUpmqSDM2pNYS8O2tzgszeMif13RWFZuhcumQhA
         juVmAYDtqvqh3n8FFe5Xrmz5EDHiCA1/IQh6hTm3ctqt2xlkFLkQ0RSTDb35FDf5gz58
         fLWw==
X-Gm-Message-State: AOJu0Yx8wZ9LjufaT846RrKRcb9J4J9EaP/KJ2lkc/jr7fRRVsQblRcC
	GeY51OIs58v3ldd4NwqvzlrFW9LRHqe8tGaqBpKqx67xQ8pXsI8WdL7NEKzgzf2B5QPUtpL0iKF
	EPjs=
X-Gm-Gg: AeBDievEnehQnoHiMYZ8r9guFo/j3Q2LDdxekpIHTh0YD0F53IJfmAtvBObXxdjQrW6
	rdX5gwl9nSAFjpkpPqH1S0jmBosOPSTp1NPkqfam6eGurnAfzWjh03AVEKMC+3hGTUmzHMQGqer
	YT1OZRPRzawxSbIL4OA47TBuo8Cg9NLBz8XHIIGleFf3EyxEtd/9wBZNuHdDD8RZv5T6wRuKJUG
	cfqvVTnBO7ox7VtE2UVk6aiM7C0XdN8e9nFbn3N/NVrAX7VbIAdtvOqcTLRR7oFRCo8J/1q4zA/
	MIJ4MnJq2w9KMXSWF/C4PZSHI8m/bxQ/41g5OpWWlIdQMPp30Gx2SPQLJzumccvtFh3uGPOBBEm
	J6aGkzJfdfeBR2ktW29cU7JNYAOnt4aXfNUAUB5oG4UNTl805dftGqqIqQXjyc909qe6tGGVgUk
	5t0R4rdw0e59TxisZduvYixlk=
X-Received: by 2002:a05:6214:410b:b0:8ae:5fcc:8069 with SMTP id 6a1803df08f44-8bc439108e7mr45966256d6.22.1778073550164;
        Wed, 06 May 2026 06:19:10 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b538c1241dsm180234196d6.5.2026.05.06.06.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 06:19:09 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp/edk2-firmware: workaround apcica changes
Date: Wed,  6 May 2026 09:18:36 -0400
Message-Id: <177807351612.2898217.17918981339866892889.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260505123408.41657-1-jon.mason@arm.com>
References: <20260505123408.41657-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 May 2026 13:19:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7037


On Tue, 05 May 2026 08:34:08 -0400, Jon Mason wrote:
> With the latest version of acpica (20260408), the following error is
> being encountered in edk2 platforms for Arm SGI
> 
> | "iasl"  -p/builder/meta-arm/build/tmp/work/rdn2-poky-linux/edk2-firmware/202602/build/Build/RdN2/DEBUG_GCC5/AARCH64/Platform/ARM/SgiPkg/AcpiTables/RdN2AcpiTables/OUTPUT/./SsdtEvents.aml /builder/meta-arm/build/tmp/work/rdn2-poky-linux/edk2-firmware/202602/build/Build/RdN2/DEBUG_GCC5/AARCH64/Platform/ARM/SgiPkg/AcpiTables/RdN2AcpiTables/OUTPUT/./SsdtEvents.iiii
> | /builder/meta-arm/build/tmp/work/rdn2-poky-linux/edk2-firmware/202602/build/Build/RdN2/DEBUG_GCC5/AARCH64/Platform/ARM/SgiPkg/AcpiTables/RdN2AcpiTables/OUTPUT/./SsdtEvents.iiii     61:       Printf ("GPIO0 Pin0 Toggled")
> | Error    6010 -                                                                                                                                                                                  Internal compiler error ^  (Invalid parse opcode in OpcGenerateAmlOpcode)
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/edk2-firmware: workaround apcica changes
      commit: 4112fda50b814ad6e3cfaefe5cad78a83114599a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

