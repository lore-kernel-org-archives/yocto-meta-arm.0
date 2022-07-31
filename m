Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBD1C19F28
	for <webhook@archiver.kernel.org>; Sun, 31 Jul 2022 03:07:08 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web09.9925.1659236820081236128
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 30 Jul 2022 20:07:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=bnnHLt90;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id r24so5879391qtx.6
        for <meta-arm@lists.yoctoproject.org>;
 Sat, 30 Jul 2022 20:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=eAAXCkJFbM6/FaKVCWLTrG3brewv20hD6Ce9V9Ep3G8=;
        b=bnnHLt90eRKyakw7/DKe+1cqjgAL+V3z9ureS+aTXvspuAbumc1wDnaA3J+OLB8GR9
         /ecdBVofihNue+Ns6eU03ISU0H8Axwu6RekoruB0mjCz2dBN+j+MPTh+3HK8QtHhy05f
         ONnrnI1D4Q3tcDe+arKVYZMfcwGjB1TTBWg0e9ZFp9Ayj1T5XKBuVXG5zYnwlxkj5YuE
         zhZZofzne3xJSUaBxshIdqfF86bjFuxFiQYtZuS4vlSr4lcvjjKGA0XovM/fT9PfJTVA
         Z/fx3whGrbvqdKVV9FTCUR6FXHSGbiR8eBzf9VUDc4BFx4g6D8Woz/TDB+lOz+2+fIR/
         GVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=eAAXCkJFbM6/FaKVCWLTrG3brewv20hD6Ce9V9Ep3G8=;
        b=rg8aRcudnJ1qfL1j9ntgpvlnTSmtD11IYtxD1SjFAimxSflF58fIaCDAS5mwznlHTl
         Y8TthLF6ZhaALCkR8a/4X9KIJWFejPK9WlZgaz3ES8bv02TBDHw8ApllJrEJ6qL5FS6u
         x76zSqrsUI9DObJsQOHIPIGi2HPI6AuXjjeXLdBqx2VYbnKDMVSjLu1ZrPSs9e1Oc8of
         ACbUPlJR5CkDaTizghUU49FuELnATLEBh1wDQ05U6+gGA8EY5mfeMIii3u2ZrEEbKaLn
         TVos+OIeUEGQkUH9NqloTUjMVVToazshYhfY6Xkk127MJa0XDYfAD5x9rxlF0ajuYYsC
         Jo7g==
X-Gm-Message-State: AJIora85q9BiO+p14Tij1nLYMyKyvJVHNp8pQWmX/5RV0Lep/eIy9Kbb
	2bNxSaM7WWXB0qAcBYOl82JNK0yxfHk/mQ==
X-Google-Smtp-Source: 
 AGRyM1tK2KwSMkenNK0qIb1P5No2HxdoofZDOcDQtSaIY4jy088Yq6El0Xx23gkw3An3EY8ST8h9Fw==
X-Received: by 2002:a05:622a:4ca:b0:31f:3a74:13a0 with SMTP id
 q10-20020a05622a04ca00b0031f3a7413a0mr9395935qtx.626.1659236818175;
        Sat, 30 Jul 2022 20:06:58 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 bq14-20020a05620a468e00b006b5c061844fsm5817655qkb.49.2022.07.30.20.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 20:06:57 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Maciej Borzecki <maciek@thing.com>
Cc: Ross Burton <Ross.Burton@arm.com>
Subject: Re: [PATCH v2] arm/edk2-firmware: cherry pick gcc 12.x compatibility
 patches
Date: Sat, 30 Jul 2022 23:05:45 -0400
Message-Id: <165923674540.386450.15151737776682580062.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <0a972044b11f7e469f122f3dc7b6778145b60133.1659090751.git.maciek@thing.com>
References: 
 <0a972044b11f7e469f122f3dc7b6778145b60133.1659090751.git.maciek@thing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 31 Jul 2022 03:07:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3628

On Fri, 29 Jul 2022 12:34:46 +0200, Maciej Borzecki wrote:
> Cherry pick gcc 12.x compatibility patches from the upstream.

Applied, thanks!

[1/1] arm/edk2-firmware: cherry pick gcc 12.x compatibility patches
      commit: 29dc2147d755c4f8089404d6993546608616a966

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

