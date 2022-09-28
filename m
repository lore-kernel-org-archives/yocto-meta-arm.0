Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392E8C6FA8E
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 13:42:19 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web08.8074.1664372538693374655
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 06:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=kkGoMYRY;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id c11so7908447qtw.8
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 06:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=GcWFVJ9nV/b+ZF5hTABdZ4DdUkkV6Fs/2LtVarXGSig=;
        b=kkGoMYRYe4LanbesEUP4+B3jUYXvTVi18x9XrFGIS3TaclSkSIh8tLD5y6DOpm1zDX
         su6+zxKRfRS5XGyr7Rf8oTUlD9K9GH1jNk3RwnG19mEvikNed4ZAXt9UOrUMleGAdTSn
         hYn93JYq3F9dnJcRD8mu5Mc1gXL+YRvi3QgppEAgVKPtocSwT/uZuSnv1yjE67+mfWpG
         5nCeD33p/G4VL8PrVWB4/Ldlk2Jms/GYcOHE0P+n6DQmUdc+Fbk77yNVeYUORGm6WTla
         xMXADFHSr+8FNWqJOnQd1PQlnOC77J17oKhBq6h1mP30IwtU2WUntCd/6aS6dtuukh6t
         9e9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=GcWFVJ9nV/b+ZF5hTABdZ4DdUkkV6Fs/2LtVarXGSig=;
        b=Ll/84fpJBRohAQ/3JBkSOIuFS5Uj/wvud9bKVGSrV2JdAyj+tYIXJl6XpeDjMSF754
         LzcRE4La1bc6L+Cp0byT6EIYLtyf1iwdM9U5EAhAqA0QS6gyNXbIrVMqCCMzaMpJiefw
         yg9KSUUthN1EnEqN3S9avo+wx/9PORgL6UJRbFsSJdeJfFcE2GT2L/Qj07PgoX9wfHPO
         LsnuCoAGrSzcMLbwqEBRQgTUgoV1OpLMeTYZ4Cv/tn5ytsjYK99NwKwPz4LFl/fxR5R9
         QFVBDq/8ymeaatloPwUi2lO6pPDKgW5nwddmXIFBNN30xYOaDsn5d6gZP8IG26KUIR4V
         LjaA==
X-Gm-Message-State: ACrzQf24SGk8sP6YKm9sYJ/7WF+SSsxL1/I0/wK4KLCYqTaf3qyc5oyR
	G8UttflC81QnTXeSUnviCYE4Zjsao0Fecg==
X-Google-Smtp-Source: 
 AMsMyM6CWIG0Nu8gJsWOeITgVSy9o9id8hmnh77nnZ0gwkcqVF2Rt4gsLk0vGDPfF+PmJl7mXZGGpg==
X-Received: by 2002:ac8:5750:0:b0:35c:cb1b:2639 with SMTP id
 16-20020ac85750000000b0035ccb1b2639mr27728324qtx.183.1664372537332;
        Wed, 28 Sep 2022 06:42:17 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 x19-20020a05622a001300b0033b30e8e7a5sm3271149qtw.58.2022.09.28.06.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 06:42:16 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] hafnium: Exclude from world builds
Date: Wed, 28 Sep 2022 09:42:00 -0400
Message-Id: <166437252283.2315819.3428789158041113163.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220926222642.3105379-1-raj.khem@gmail.com>
References: <20220926222642.3105379-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 28 Sep 2022 13:42:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3856

On Mon, 26 Sep 2022 15:26:42 -0700, Khem Raj wrote:
> This does not build with clang from meta-clang and also does not build
> with gcc either

Applied, thanks!

[1/1] hafnium: Exclude from world builds
      commit: 4cd8d73788a9d98ad367f61447de28c719ca5ec3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

