Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE60C19F28
	for <webhook@archiver.kernel.org>; Sun, 31 Jul 2022 03:07:18 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web12.10003.1659236837537517295
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 30 Jul 2022 20:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=zUHbd+Qh;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id v2so6211892qvs.12
        for <meta-arm@lists.yoctoproject.org>;
 Sat, 30 Jul 2022 20:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=aTJxFtSst4fkNcM1zn9+GkRHfGKYepywf7znBPy2zWk=;
        b=zUHbd+QhokZMt2bWQTelMX0pRZh1Vc4ik1jfhh7oyOHUL65ttWgwr/n+kHO52nbJMQ
         PYcJMoac/hi0w1vdTWU9yo86QZc/aZpkwfi0SuSy9x9tXLjWk/3VXgwN53nLWBueJzZK
         5RiZvBv19Z233l+eaT+tqAAE3+BNrI4gRB3HRWjvGRTmNwRtjtpkMtkFR/iESfM1BMdN
         Mh1qjrR7r7Obs1tFdT1eF0B3QdYHGhYJP7zm7zEm87df+5IyBQJkIIN/2PaG/dHZUOvW
         fNgvx2q8bdJnnEzNelN7rqkVvldshIrLMe33hLcavlglltUI6hktOjtHARaZikrkxEQg
         pZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=aTJxFtSst4fkNcM1zn9+GkRHfGKYepywf7znBPy2zWk=;
        b=Vmdz+25xQr3tSCLCXZmrYGR/UHRxUrLfJOUFMB8nmr3xSigaZOJOBGIblKLV23xwNE
         Z91+WzDvZkigUdC3ob5IzyBjPfAG1hHMuPmK09ecSX8MyV5YWnLEnqLkabYnYXQENYeT
         Cs8Mm3uHAHd6Bm07PuZ/zC6CGAu3hNhxEcw1TWSVpLmsYmoXc5yU0AGOWcx4llMsB/vD
         r/fpELBp8Ary9Nw1jCETQIjvrFVenlvjXdpEEyu7I8sctTLry1S7dwsCc9Ee/tlZ+EwX
         uIiNEekGIknOOznr0eJ72OfnWtLGxH5Q/OteTpJ4sxBXrA0GoJdn7ibX7HN2wZj+g9qU
         Tsjg==
X-Gm-Message-State: ACgBeo0ZQY8iqGAWgJt341Wrrf1ip9iz63Jqiv0O7Vuv01Y8uzl52eT8
	DdBKk4TmMq3W+wlJ2kIyyWk6v6k3giMW4g==
X-Google-Smtp-Source: 
 AA6agR612lbHiONr0IeuOUjfpyQYYN/MZQGAW5Qmf59rlnQq9pGMou1XIeMMFeaxheEk//quUWHFAA==
X-Received: by 2002:ad4:594c:0:b0:473:6b0b:d3a9 with SMTP id
 eo12-20020ad4594c000000b004736b0bd3a9mr9256601qvb.73.1659236836104;
        Sat, 30 Jul 2022 20:07:16 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 c4-20020a05620a268400b006a6a7b4e7besm5778434qkp.109.2022.07.30.20.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 20:07:15 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] optee-test: Use system openssl on musl
Date: Sat, 30 Jul 2022 23:07:00 -0400
Message-Id: <165923682189.432057.7185727575545159856.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220730162741.3624780-1-raj.khem@gmail.com>
References: <20220730162741.3624780-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 31 Jul 2022 03:07:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3629

On Sat, 30 Jul 2022 09:27:41 -0700, Khem Raj wrote:
> bundled libcrypto.a in optee-test sources is built using glibc based
> toolchain and expects foritied _chk version of the libc functions e.g. __sprintf_chk
> which wont work for musl. Therefore rely on freshly built openssl by OE
> instead
> 
> Fixes errors like
> 
> [...]

Applied, thanks!

[1/1] optee-test: Use system openssl on musl
      commit: 31452ae4cf0be3d2d78a4019e44f9370b9e93fbb

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

