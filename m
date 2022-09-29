Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B879C433F5
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 19:01:48 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.111.1664478097703929582
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 12:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=gZ5xaJSa;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f181.google.com with SMTP id x18so1455000qkn.6
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 12:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=GcWFVJ9nV/b+ZF5hTABdZ4DdUkkV6Fs/2LtVarXGSig=;
        b=gZ5xaJSaKBwPCOQPKhZqNQRs95ZDf/Ac74YOFCCmkNZrOa0y+KsbdgH2YvoGZfzcp+
         lEORYJ3DRwQQeOPR8AiY4PjK5HLjDJN1jHqaMUeq+llAK7GEaSsMez9pHeVVYgV6x9YP
         wp2eca3Je8gOJ+SjZ3V7RoAgzBATv/j8alkSlo0b+DFRztFrUe13QjQ7exP6ZNLY5Pmp
         42YkNnSjurVeapM5lWZP/9b3sBiWpV3DMwFp4aRFK/p9D/LJInqARm6gA/ZCPG3zH0sm
         CD3J1r8JSIVrMJ3MWVKh2XKhnw4PWJ56TUPU0IMdIWl6hPCO8oJpZjTCLz0Dxc+iCkjp
         ksZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=GcWFVJ9nV/b+ZF5hTABdZ4DdUkkV6Fs/2LtVarXGSig=;
        b=X8kyMO+iUXaq9OzbeS9rsgE+/O1wWCa58A33W38pFV2mM4bwUWzymxQ9jiUm5ncU4p
         WZlwcIC6qslqjJjFUjPno1wIX1HidhiYnTDDPbOBMMlGItWKtgKkn/UouyTjbsxcRQCD
         U0FH8jXDMefPW8FtgLpedkVRVGk+ZeJ4emm3eIe25S6QPeJw/7DhijXLar8LLPX/sxx9
         f7GGBcYRoFADw9ThYHpRe6kf4dEQpYRC7Id9PQ8UxmhOdlql774zkyrilCE4Uv4F3kih
         2Hc3l9m29zV1L3oUV49hVQraSOwKlSGH02AzeHrYphQeF2UTdjJdc156yOHRlrEXTY5x
         ldow==
X-Gm-Message-State: ACrzQf159tn81tEiubK1S5FhMqV6TcDQJ6gvwZa+jy7QDa3y7BbuDwP3
	4QdBfsm8rfxOvkTL/JiHt9z43Wteh8wf/g==
X-Google-Smtp-Source: 
 AMsMyM56TaYIRAmHvggqEu1vLR0kWaYf5kgIV3vwxUakTlOz0inn4SSM5MAisMEr8RZlu/yt6GwYyA==
X-Received: by 2002:a05:620a:2a16:b0:6ce:375b:b424 with SMTP id
 o22-20020a05620a2a1600b006ce375bb424mr3434103qkp.436.1664478096448;
        Thu, 29 Sep 2022 12:01:36 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 f21-20020a05620a409500b006b95b0a714esm183538qko.17.2022.09.29.12.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 12:01:36 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] hafnium: Exclude from world builds
Date: Thu, 29 Sep 2022 14:56:33 -0400
Message-Id: <166447779548.3284601.13554077961828597126.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220926222642.3105379-1-raj.khem@gmail.com>
References: <20220926222642.3105379-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Sep 2022 19:01:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3876

On Mon, 26 Sep 2022 15:26:42 -0700, Khem Raj wrote:
> This does not build with clang from meta-clang and also does not build
> with gcc either

Applied, thanks!

[1/1] hafnium: Exclude from world builds
      commit: 4cd8d73788a9d98ad367f61447de28c719ca5ec3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

