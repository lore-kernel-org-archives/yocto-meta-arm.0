Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA65C6FA92
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 15:32:14 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web12.8971.1663947126906295201
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 08:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=aD+XWNMF;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.42,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f42.google.com with SMTP id l1so110908qvu.11
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 08:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=RAEanFM7r/QRRjwKcPwUc8+pOhzTXhRmH4108g1NW7E=;
        b=aD+XWNMFh2Bt+5RQoktJ0zk7S24p6lhi9ate7UR0iSa2Ojkv/pYtdg82BBXiG3tBfp
         Y2DzkL1niLmPQWvMa8SepGh06fZFC8JzsT6lDJZqp1r48clMGk8D2tDZ9amA7ESQBcEn
         gtMqDpXDQOKIevI77GhGbg4r3mcqIEgXp8z0+gQGrUssO6ou3RSLeGF9vJ5SDtDZiH8T
         zsdTuhudviNfKFVii6iH8XntasSItQqs6ymqWRUrxbsE8Tha3wVLnkDCiyEmgqSaiEpP
         wrRNui0Y+SUOfGbC+nE7+FJLgygfVkhcKBmIMmFZW5mjnYHgSol31iI/iXEgES+E/0ko
         uZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=RAEanFM7r/QRRjwKcPwUc8+pOhzTXhRmH4108g1NW7E=;
        b=egLc1LePtrjjGyaJvOourIQ2Za7qFF/WhnVQrNjrhdot/5djERIN9bYYo8li9qZFB6
         /qCPUjGxU87stS7YddgawgWb35l7tCc4gP5rJl56BFjhBDQBtFOvA6qvvSwvXFwVxgmk
         OkPXcjSpRBCzZGS5T89NytQKoe0iyHA7tTLlAyKFHp5LdKUxoEc5JOumfZZ3FEN95XeA
         sSCvbn3kXhsutKEjxP7pMsyMFIlwe4opAxC8MrzXMFjpbOxxrO88Qwk16Ay7e1nCXIku
         Z4Whxr5QjbbN2yHDn81Yuv290Y+8PoEtAUxfrstrk/3QTUPG49Zyg2UPpxPoU7EiY5iZ
         tGzw==
X-Gm-Message-State: ACrzQf1VW6uwsVtcFPHURob6VlgdT1fSM0pBSXVLlmBn2kUU8Tl3bd5t
	3WFmf49IQx/LWyfvSLhxDNhmSnBOejIA5g==
X-Google-Smtp-Source: 
 AMsMyM5WZNchq/tTvkn0f4F4QZ38+G8QridKoXrb5h/r94eunmCZ5MjzrWYs+t0w0gTLl93jcHuCPg==
X-Received: by 2002:ad4:5bc5:0:b0:4ad:73da:6083 with SMTP id
 t5-20020ad45bc5000000b004ad73da6083mr7653930qvt.69.1663947125625;
        Fri, 23 Sep 2022 08:32:05 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 az35-20020a05620a172300b006ce611aef61sm5797111qkb.95.2022.09.23.08.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 08:32:05 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] hafnium: Add a fix for clang-15 errors
Date: Fri, 23 Sep 2022 11:31:01 -0400
Message-Id: <166394706727.2062239.5603756100145000012.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220923032400.2890392-1-raj.khem@gmail.com>
References: <20220923032400.2890392-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 23 Sep 2022 15:32:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3823

On Thu, 22 Sep 2022 20:24:00 -0700, Khem Raj wrote:
> 


Applied, thanks!

[1/1] hafnium: Add a fix for clang-15 errors
      commit: 04b78e80b071cd90c5c1a2cc7cf5c011ae16cb7c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

