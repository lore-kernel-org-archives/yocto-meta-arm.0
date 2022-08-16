Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BCAC00140
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 02:08:55 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web09.11069.1660615730042487082
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Aug 2022 19:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=WG/nna90;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id y18so7212775qtv.5
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Aug 2022 19:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=TWo1uBfFvorPiY9MFbnk9gEjMVNbYLJ4LLrLtAmI8Ns=;
        b=WG/nna90QPeTdwmy8Ihf8J/S+rlSisX6aot3c7Fjbo11E3fc5qlfj+kq7i0TGz9htA
         6QQ8rgHNDcl0iraf0MT3FP7Z5eKPo3JS1sLyQt8W9c5y7G9hGxvpBG/jgFs5amc730pC
         v+Iut1IlcgnTapld8vavtVhpWrhwYegPagkdfU5e54VCR/DUqR8CQDUdp6Ymv3wYU0NH
         K+OlrV+qkQ38wQbUCeseGuYOy/Jnf1ksuK4sWdaKgCkyJWParoPdSGlqbiJvfm4MJqA7
         JEjVKZR7DUkx/7kI5zMsf1AFU9/wVWUcAnWTcsuIwFw9ordf+YzHbnfGNfFjJ6tMRKEm
         DJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=TWo1uBfFvorPiY9MFbnk9gEjMVNbYLJ4LLrLtAmI8Ns=;
        b=Yt10DZr48ID/TFqRtAFxxVvQKx3c0V6F+CYUElxyDCs+lcFsXGN9I0a2afZt1q10lp
         fDgYJ7taAgqYfHzts3E7GGIjTPKh2VOKbNpppRj9CryjnwvL1fkLuYfuGGN9+6W4lfYh
         rS55Qkb0uORDOPDShWSReYtESbI/Rgz1osaXqNcQhz0C4EBxxyG8kPD86zjxA71AWHMx
         tLu/3T/Ny27/uNthOZfqXslKQBXob5u7HIpkIFE5i8Xh6JPMtdp7FW+GzDEDKofdNOaO
         vIqTme0sPgDHwZ5vGeU1gF8YFqN7HYHzEk+FrizvOsUOioIBwLbOZ6vchm023eq+YaWM
         e9QQ==
X-Gm-Message-State: ACgBeo3nznGvB68XLH1e7dWe3fXcoUNOhM0bC7316JFz2JytK4EeJNsw
	0asb8K48uC+FsBw6LNEu/ef5GjZbrUr4wbZY
X-Google-Smtp-Source: 
 AA6agR5VH4Nth9Vi9rXG1hxZkMUU6zSYhMdP0fvfeSbe1tkMKagzNZbaQ0pAGqbE6EO+aghwLiWEjQ==
X-Received: by 2002:a05:622a:138e:b0:343:7e0f:f9cf with SMTP id
 o14-20020a05622a138e00b003437e0ff9cfmr13426175qtk.314.1660615728709;
        Mon, 15 Aug 2022 19:08:48 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 j18-20020a05620a411200b006b9ab3364ffsm11158814qko.11.2022.08.15.19.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 19:08:48 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] gem5/gem5-m5ops: Drop uneeded package inherit
Date: Mon, 15 Aug 2022 22:08:22 -0400
Message-Id: <166061570225.998117.2428279974055779468.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220815151137.1396680-1-richard.purdie@linuxfoundation.org>
References: <20220815151137.1396680-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Aug 2022 02:08:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3692

On Mon, 15 Aug 2022 16:11:37 +0100, Richard Purdie wrote:
> package is always inheritted by the base classes so the recipe does not
> need to do this. This became an error with recent bitbake changes, fix
> things by removing it.

Applied, thanks!

[1/1] gem5/gem5-m5ops: Drop uneeded package inherit
      commit: 2327cb30337d7ac1912bf0a17cf26f77f456c4f8

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

