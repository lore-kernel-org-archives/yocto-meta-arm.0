Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10EC2C369A2
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 19:13:53 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.35029.1744398824749155717
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Apr 2025 12:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=UteedSvn;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-477282401b3so23086771cf.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 11 Apr 2025 12:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1744398823; x=1745003623; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KrLSqkmruFYBDPSl6USFItazigbdF6YOlw+jnew+EvE=;
        b=UteedSvn0tSq4HbYhYXqwpCUbewSsGUYiplqhOllovjiYVpLQcJCMB09NfnmOpxHDn
         mrRX9mWw+dWcVQsc0JDBHbmaSa4yMcs2rr7UxcigoKEpZn3ukNH0DOwbEHBFuAesboto
         clxeQ8NB4EcvaEyEt7I5JYy76nxxxahyt0EBDctbRAH/nsIudI79m49BFCUOgVRliucz
         vT4txmEY6s+/UB1J/X252tYoz62kiV+06l3/tQeH4NU+RvXY+LMNbDwBgNf9J/OxPTss
         Do7FUOmAmqGAXX9aGw4Ei7EjTO7REY8ymi2a0sHuFpGwVq5ETQbDUi7tgxZLRlQL9Ckv
         pDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744398823; x=1745003623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KrLSqkmruFYBDPSl6USFItazigbdF6YOlw+jnew+EvE=;
        b=frIXFzVrKUbuwmJG5C8Beaab0LS14fLBNppmalJJ/rBncu3frhB7ksl8SSb4VcD7cT
         l172n8kygzuVdie1xRqvtS6vxxv4vNgU4KNxWKyNIxc1eoFVWNn72ufqJEWuLRaPm5c2
         z8M2UX/Ef9EvPpdLY6QrzXlWOAMVKZoPAQ+CKvJ6NcooLF5HvnRf8NNB2+L8z+WwsCZt
         PlhzY0YbByouLvAS8mXK0NxQkitm1bSmrKrhUNN+KZuoI9Zi7+aqyER2wFUDyspomje+
         iqLrByTj6JyTDXzzklCWMcDWkXofat3orCzeoMeqTmqe1RIWLq8xgv3tagV9fT9RYQsu
         5d4w==
X-Gm-Message-State: AOJu0YyhNroh7m4gZi43HHwN/r6Vn51yiNvMdOQ3OGoSbry+4DGofmgS
	HwrWz+G3CGpCmoyVhvkOnC0/8WAIZz04T99NQILCr+6nEZF2f41zVaqTyA0JJavQAsADUpcJIO5
	S7Q==
X-Gm-Gg: ASbGncsRU+9K3j0yfaqCxAlkP2NNKfkv4EduNVB7SzsLAK39IZScYqv7UWcxZ4oKko4
	HnUdMfbSsDbtT7RXg+5cZVAiAu7jIBI0dZETNO993HNkHaigSC0SdEhSyebs8NHpEQizz6YWs1p
	n8Pi/QveOyS5d0hfloCHX88/HxQmG60vNe/iH1j9hXP0sY6lZFi6SINlNqgMZVpTF5c33t8v0Aq
	TwW+UpWGc3M3OkjN5G5jsSv+mLK67LrRMKwaCZEowbxofEr3e2rzW9/clIorIG4hBYarIikLd8P
	AtqNR2CIzku3a9VDEGYgREzfstx5E5EK
X-Google-Smtp-Source: AGHT+IFFVJS4hw2skWTIkfbBZlquPUeYimfasP/efeyO5L2QL7lMs2J12oFuKMGgxW/5O8+jnQaDtw==
X-Received: by 2002:ac8:5a05:0:b0:476:9296:80a4 with SMTP id d75a77b69052e-47977526becmr46367171cf.7.1744398823450;
        Fri, 11 Apr 2025 12:13:43 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796ed9cc14sm29612411cf.56.2025.04.11.12.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 12:13:43 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] classes/tfm_sign_image: Fix assignment whitespace
Date: Fri, 11 Apr 2025 15:13:32 -0400
Message-Id: <174439881347.2238189.15181607937703868102.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250411093100.3753172-1-richard.purdie@linuxfoundation.org>
References: <20250411093100.3753172-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Apr 2025 19:13:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6462


On Fri, 11 Apr 2025 10:31:00 +0100, Richard Purdie wrote:
> Fix whitespace to avoid a warning with newer bitbake.
> 
> 

Applied, thanks!

[1/1] classes/tfm_sign_image: Fix assignment whitespace
      commit: ca97d0fcec4f75cfbb1287041235c5c7be1c9b98

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

