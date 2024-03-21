Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3E3C54E68
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 03:47:55 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.217.1710992868344309562
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Mar 2024 20:47:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=T6ncLvIG;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-78a16114b69so57910885a.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 20 Mar 2024 20:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1710992867; x=1711597667; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LKCsPcwar3TN/mlyemrRZGcGJ04nZScygsZvl9fPWHw=;
        b=T6ncLvIGZi8yFF44Osyl+TR04Ce5IbNwoo9PZsA3ikR1ho6lRuvR7+fAB0vo0WzfgL
         syrhNU7K4aaQXiEQczBhohtohFxlV2une7mUrFyJA3FRPiEnpq4VhUpxH29F/Clawc4L
         +uUCRCnt29hPpWfi15JGtFCb+GfInrSOA8HqX9UxCtGxr1Q0Lje4WNQQUC/mg1cyNACD
         FEHSil9eOGm4Ib9O5Fiduw7XQLyVfMac3PISz0DTBGPdKhnUBmVFnfuBzWxfkwK9Q5r5
         lrJKCHkkEptR27w/mkratc6Qx1K7cpzMfnBmAyXFiUuPMsJ68PCTfNGkfbjNeyJWX3rO
         MWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710992867; x=1711597667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKCsPcwar3TN/mlyemrRZGcGJ04nZScygsZvl9fPWHw=;
        b=Lqtspm3m/giEtoz11Vz/fiYt6oGloE9gYRAtzRVFN0litq+G1exc69oZMCgJdLFSjf
         ZwnesAr+PVjWLmp4o741uMGFE+iOF0tj0QOVQHG5nQaVgJpqZ9yFxQKVX1sLsGuxOVV2
         KbEybMbZJ8df/iivqSCbi6UwLWa6RbLRmIAI+uUP9uSthEK+G4Bt73T/avmxVJU6bPrU
         T7KoMrAPebFCEm3JxnqcX5IAomS+Ucb3aQ0EmvOLAyly6QjVYYFUBLlzxnHuPRUG3e+u
         EBdhAEqVWA3xGPP+sT+RsJaGbX3C0RTR+a8fLb41wwp+dHxKZLusmA5YyOnoWYD/uArn
         yr6A==
X-Gm-Message-State: AOJu0YyaIuc1fJhfve9eXPrzAC/QRjti3BXbcmqthW9Xro/4R60vClvg
	KvElwwelrAzZbdvT7UkftIPqvy+WQJ1Q0JbCjyBIswCS0yqueuFtYYW+PIKEb75P2a/hTjjYZG8
	=
X-Google-Smtp-Source: AGHT+IHTsItRONK3gn7Reg03JszME2KWxfYXBbkkiMarg+22LlRPvNlOKZKmzkG7SMCINV7txUmnXQ==
X-Received: by 2002:a05:620a:40ca:b0:78a:31b6:a20d with SMTP id g10-20020a05620a40ca00b0078a31b6a20dmr254533qko.0.1710992867183;
        Wed, 20 Mar 2024 20:47:47 -0700 (PDT)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id b7-20020a05620a0cc700b0078a0660a8bcsm3025110qkj.114.2024.03.20.20.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 20:47:47 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] CI: update kas to 4.3.1
Date: Wed, 20 Mar 2024 23:46:50 -0400
Message-Id: <171099280981.1316622.1700349922572438228.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240319145926.27662-1-jon.mason@arm.com>
References: <20240319145926.27662-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 21 Mar 2024 03:47:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5469


On Tue, 19 Mar 2024 10:59:26 -0400, Jon Mason wrote:
> 


Applied, thanks!

[1/1] CI: update kas to 4.3.1
      commit: da97414dfbc36ad12876e937f7a2b9b98669de3a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

