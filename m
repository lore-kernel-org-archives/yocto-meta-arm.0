Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0453DC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 15:15:01 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.9278.1646752500389869748
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 07:15:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=avbPRBPP;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id o22so6718691qta.8
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 07:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p2LwbL8BKTr6+pfx0DVXTSWB5T8MPL9Na9O6iOYSur4=;
        b=avbPRBPPXXVsClnAATdTZXO7J5Xvq5BYZsfun8m6Kn5EGczYeYawhwWOa6N2YQzzMA
         AoRztYncDi+i/jYooeHdIpgbRnbce99tPhVoFldHnrmwUumD5gklvTIS0h/SEVkGjJkT
         vniFj5RUe47rzMps22Wj2NsOdVE5/gPJUnnqub9X9//XRQ0lpsZlg73vHJ0wt5fTzuRZ
         AYTJR1swxUJySuPEttO7go34Uo0L3SFmsaHIYZWT9ozK/1uUl05eytNrjgPASYhSgyZX
         1Gz+XgPfXeyc5l5tGNB53PdeQTkTb1RwttqERLVTPhwZDzdYwUsTV+lk/Kcaw9gbAyKO
         keyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p2LwbL8BKTr6+pfx0DVXTSWB5T8MPL9Na9O6iOYSur4=;
        b=73OI27x1qUSbtLIGmgv+fwyspIXDojifhmjJIU+Ao7GlUJCkuq9rXXF0LrfTzCnoeJ
         U37yJtbv+0Ux4itbF64U6FU+/1ZgEfOrTi5wyEczuVjqr36yHLVX0S1LHQ67kwc6YKCQ
         Uln3kudhYDsTKjSRkAVRNM+RO983zR+UqaD/2YtY+SrgxKdZLvtVG5T17MRCRTiXd3mt
         f83wEgi09/sm+yYOCOKWFDIv3ajE66FX7J4iYaQA5zqdh6ea4cAVChQS0U7XnI/DuQjL
         LD62CqP1dmPoJUv37v0NQrbWzjMHy02iuFTJ03pHAxwDW20h0ImxCYISYdDX+D68UHkG
         pWtA==
X-Gm-Message-State: AOAM533O4p7ofNelq2xf8HwRCFvzmzvW9R6SDMu84PksGyx7+S6gdqxe
	SrwjAWMnBd7cCVQvbIO+9/ShLecgYGkmLA==
X-Google-Smtp-Source: 
 ABdhPJxwWEt5KhzQxKU7wRg0EZyCezWv7XDgcQyUAkDdM8QGrBRuQWniiFtwgf2FIUyNktxT9lFHHg==
X-Received: by 2002:ac8:5dce:0:b0:2e0:67f8:132d with SMTP id
 e14-20020ac85dce000000b002e067f8132dmr8197722qtx.417.1646752499379;
        Tue, 08 Mar 2022 07:14:59 -0800 (PST)
Received: from localhost ([2605:a601:a66c:b900:e36c:6a84:e7f7:3230])
        by smtp.gmail.com with ESMTPSA id
 m23-20020a05620a221700b00649555cd27bsm7636061qkh.79.2022.03.08.07.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 07:14:59 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH] arm-bsp/docs: Minor fvp-baser-aemv8r64 fixes
Date: Tue,  8 Mar 2022 10:14:13 -0500
Message-Id: <164675245458.524244.17515323153753583157.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308113450.3801197-1-peter.hoyes@arm.com>
References: <20220308113450.3801197-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Mar 2022 15:15:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3132

On Tue, 8 Mar 2022 11:34:50 +0000, Peter Hoyes wrote:
>  * Include `--upgrade` in pip3 command to ensure latest kas version is
>    installed
>  * Ensure all underscores are either quoted or escaped
>  * Fix P9 example command

Applied, thanks!

[1/1] arm-bsp/docs: Minor fvp-baser-aemv8r64 fixes
      commit: fbfd015578f1c206c9d44b5bfda485c81c411e0c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

