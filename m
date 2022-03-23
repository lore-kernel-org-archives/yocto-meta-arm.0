Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC55C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 13:32:27 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.9211.1648042347183989437
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 06:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=HlG9jibJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id c4so1115463qtx.1
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 06:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PkIGFZSxPHxCOQCvs+UUusZOvfF/R5GDcPf7GqdmGxw=;
        b=HlG9jibJ3ktFUs+nliID/fryHwDLUi7plp53pgARxo2m8ZIfqfPXSGUG5dstAhz+n/
         6La6Av68vIywzq5dfbTT0I3VmIPhdAefLT9irAENV1+Hpp6U2h4FJBIIW9kqcgyGlrUe
         0nhdLb7jz7dAYVNKUtxChRFmLwFkmIAlgYE++Nl3mB2Jdw640FU/sUtlwskUyYGRa7jH
         EN+l9lC8r8FLyAJWkC9cGcIehhbW4nHZSvDCj5+COk/KGOG4GJsy1k2xP3VhleMd3k9/
         1ypbd9yb1mJdXPFbKqLA97VjqacgCzv9BkZGCn94EvCJUL7mVDTtmX8HGtIx1mpEyrlq
         BWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PkIGFZSxPHxCOQCvs+UUusZOvfF/R5GDcPf7GqdmGxw=;
        b=IV02i4iRgz5E4grwHTMfyUS7jH/WxOLD/HqliYbR9cifq7FdICRAyLCWP58NbOnDWI
         s91qqaL7BLUM21szEFdukSKVIh6I2Pnu1PXHn2RJ1Pd9ErSo3Z+/D1EQpbhpa1tcGrMi
         TUH9uY9m3rp1/aF2vAG/3+BUKUM5fP4d+suh3EYngQ1OfaX4mbngkFBqisFl5hsExeLH
         XbWyHqL2D1ZBk3NFtIIvGRcerLCl7pEreNww5Y+AHChhVFPpEpyKNwl6Bt04XH2lNGeh
         q2Ldr3937lo1c/Jo2lNa56PRSsSF47ho9jVzp0eKpnqE4+3X+k8xs8HT+IAtT8YJbMdx
         Gg/Q==
X-Gm-Message-State: AOAM530ionbZfPQV/gmAs3dzUY6rpdvkuttFFZ7hSqVEKdhjjOZu5piF
	DsOQxM4e3Ygcq7JnEI/WBUpaX6g1fAndyQ==
X-Google-Smtp-Source: 
 ABdhPJxgg5m6d/cYuRCQqyDNchdWdLaXIZ2uVZRLjuNBB8LkKOwF4NffI8eBdTiCMqn/aF1lss4oSw==
X-Received: by 2002:ac8:5953:0:b0:2e1:a12b:180e with SMTP id
 19-20020ac85953000000b002e1a12b180emr23915280qtz.454.1648042346009;
        Wed, 23 Mar 2022 06:32:26 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 c20-20020a05622a025400b002e1dd71e797sm49136qtx.15.2022.03.23.06.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 06:32:25 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm/trusted-firmware-m: remove python3-pyasn1-native
 DEPENDS
Date: Wed, 23 Mar 2022 09:31:22 -0400
Message-Id: <164804228335.3978431.10280843926800548957.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220316161639.215102-1-ross.burton@arm.com>
References: <20220316161639.215102-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Mar 2022 13:32:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3203

On Wed, 16 Mar 2022 16:16:39 +0000, Ross Burton wrote:
> The use of pyasn1 was replaced with python3-cryptography in mcuboot
> ebd050. This is part of mcuboot 1.3.1 onwards, and TF-M 1.5.0 uses
> mcuboot 1.8.0.

Applied, thanks!

[1/1] arm/trusted-firmware-m: remove python3-pyasn1-native DEPENDS
      commit: 1b205211ea704c4004da45e2b8be4eb55ad7879b

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

