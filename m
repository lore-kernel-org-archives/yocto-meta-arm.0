Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63438C433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 16:38:29 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web09.193.1664815107048508526
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 09:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=4Gt+FkZK;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id g23so6660539qtu.2
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 09:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=QAz740xg0jKh67wYAnlorbFE4T3/5Aq9IW6C/yVmm2c=;
        b=4Gt+FkZKjK/VTfB/evi57KoyzAA21Hj7aGT+lyq+yqcg6PuABTbQfDw51+t9ts501i
         HZ/utOpCrBQtL2rlpx6gJBgdUhNVjn57W+KzSY7v6QbgldZngVKuM3BaMmnXbRDm+hkF
         paxPGAyjIo7PwWCFxRRAMXNOP/k0UkDAJF7YkJJ/PzOfW+nNBBeklO5ktZVt0xqfgf5P
         fANFC03T6UIruyPTpCOEppHJCrSjNCFFACHPX9V6Fxw9ncZGofqWj+i0AVU3CEtgb5RP
         GN5Y3Qf34QIIUCYrf1pV4XXkvRsYODAXWlkDkxV7lqSA91b2efmKAiftH61+x1wjWTaI
         4rVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=QAz740xg0jKh67wYAnlorbFE4T3/5Aq9IW6C/yVmm2c=;
        b=peJl+zBDxRu7U9iD1PF9RNWtjLinStD2K8DAHSt+GRxH2jHxYr9RA+IYbpt3Qvz/Z3
         FlTN74y+b1562KSCZ47lMDlBPDzjlKQYP1JtpQry3mlLRta9XaWfKkmRi/0mr3NXHa4G
         RlqJFrF320MEpI8q59i/U+AdltaeUkZR4ohuEIHYTwuo5KfhyShhah3NF/VtzHJ+I99R
         ioLmOCUz9xW3iLwT5HVTgo+ieRjFgWBrNkz9pL4YftjOY9DjKcE+CXi551zOsag3MMZ+
         plmhUqto25t0l56IOHZiuk9jtygRuVIf15pyGiU1y7RHunJk6AM7tHCl/aNgnrL0zf9v
         M7gg==
X-Gm-Message-State: ACrzQf1ARbYoGNyR1AhADDOTbGNj0a9PZS9Fmqb98gQFQLBXPQyj+OJF
	7WkpNBE3ox0C04V/ukYQ2rn8j06NFEYXxA==
X-Google-Smtp-Source: 
 AMsMyM7JPpHqaseUGEvvY7zw1QVdoF0437tXwzMbcwzkwK/O/1UUTHVrPKVbi80whjzwPBHiDFVmww==
X-Received: by 2002:ac8:5794:0:b0:35b:fd92:6fae with SMTP id
 v20-20020ac85794000000b0035bfd926faemr16211972qta.429.1664815105624;
        Mon, 03 Oct 2022 09:38:25 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 w6-20020a05620a424600b006c479acd82fsm11564615qko.7.2022.10.03.09.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 09:38:24 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com,
	"abdellatif.elkhlifi@arm.com" <abdellatif.elkhlifi@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 00/12] corstone1000: upgrades for FF-A, Optee, TS
Date: Mon,  3 Oct 2022 12:37:42 -0400
Message-Id: <166481506585.1286959.11066389463967112799.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221003130051.28934-1-abdellatif.elkhlifi@arm.com>
References: <20221003130051.28934-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 16:38:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3907

On Mon, 3 Oct 2022 14:00:39 +0100, abdellatif.elkhlifi@arm.com wrote:
> This patchset provides the followig new features:
> 
> - The latest FF-A u-boot driver patchset sent to the u-boot mailing list
> - Optee v3.18
> - Use the new Trusted Services design
> - Dropping secure partitions recipe
> 
> [...]

Applied, thanks!

[01/12] arm-bsp/u-boot: corstone1000: update initramfs bundle size
        commit: 63c7e60c1e0357f02ac9fe55e866e475d9c28321
[02/12] arm-bsp/u-boot: corstone1000: upgrade FF-A support
        commit: 607166e3bda5bace3a2353f319933ca51f946bee
[03/12] arm-bsp/optee-os: corstone1000: upgrade to v3.18
        commit: 8817e91e5d55f083d96562cb3d31b9fa5bd47040
[04/12] arm-bsp/optee-spdevkit: corstone1000: drop the support
        commit: f483fcfc68a90ac0411ca8f70bfcd9032181a0d9
[05/12] arm-bsp/corstone1000-initramfs-image: remove obsolete packages
        commit: 56d53d439391c74efbac4abbf88cfaffdc5a6da0
[07/12] arm-bsp/machine: corstone1000: disable pulling the kernel into the initramfs
        commit: 068c2f37c05004626323ff29da62d587ec45fe18
[08/12] arm-bsp/trusted-services: corstone1000: add MHU-driver
        commit: 37a9dbc5b79d03a29c10cb9fe4662eb676895175
[09/12] arm-bsp/corstone1000-initramfs-image: add TS PSA API tests packages
        commit: ddbf0addf144fa0197f0c8ba678892504e38dc55
[10/12] arm-bsp/linux: corstone1000: use arm-ffa machine feature
        commit: 126eebcabd9d19eb1f308556f78756e3648bc204
[11/12] arm/secure-partitions: drop use of the recipe
        commit: 7a42f5c64238b238047b83a13c2615e21878e11b
[12/12] arm/ffa-debugfs: drop use of the kernel module
        commit: 04a7ba3c77b6bbca1d4bf271ce35b4dc9a77c694

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

