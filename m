Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CDB0C4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 18:46:38 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.26573.1712861190982856604
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Apr 2024 11:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=xzD30/x7;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-78d6bc947aeso9494985a.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 11:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1712861190; x=1713465990; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlo0BDWFpyP1qzDVox1OS43YwgBUD5rTboCUOQTq1yg=;
        b=xzD30/x7naiGJstobWRFWNIf4ISLmc6YlFY5i8IeMoLJNhQ8nzGQvqJQpkCJcUe+c2
         KxU1lp5aEHsDk2hkBy8WRpgA4PUlp8tH9Z72swyJQsttK9MTl0V0tp0B4vnFxB5HKnrC
         neq8ZWzz9hBBk8kUAce4tFFZRISeB79wmflyD5A6tN4yDeJrnpad2lKqw04FDUhvAOM7
         U7b2eiyZpqNRRnehaEl04p6HGcKfspfNBorIIpJqLi9jLsvS0fNjwt94oCS5Pm0HfbWV
         tMeUqUnaacwvHakiQxWpdtgpLA76GmbTXKG/4z48L0CNatlX3Q6DmRRfu+ZrwTZY9dF6
         j1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712861190; x=1713465990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nlo0BDWFpyP1qzDVox1OS43YwgBUD5rTboCUOQTq1yg=;
        b=oFb4W8bppKhpcptwIJEqWQbgpFRWA/PTcYNi6Qr3zEh0rrPM3UmI1ANU47dKPuUIIX
         mF+Wj0YSZP+pa8xKQmJm8NRrXNOm4WXAY+yCjwxwVRChpUvKY6fVkLSHSMJX4Hd3ozg1
         zizA+WttdaAinUSU6zP0Enb55AFNFrFjsYgEJndxfhmjyQnhphKIQB1N1zuckkXS91jr
         hnO6yxRhgmA6EFMPvp7zqi6T2NN9MzfsfoCkg01daHUyAcf1WA6neKw3a0EW0mmEUbKJ
         GkcLKHLG40bodO0r8RqQeyw916S62M6lmBVtehwP1LE7eUnCNUuL0QvESzNohhaddh7s
         t0WA==
X-Gm-Message-State: AOJu0YwQMRJnCI2W27C9+j3xQKaZWrXkrnrvEkYtAV0DKB/S0bd/vy2B
	EedpO26nDG5vnvB4satpG2Yj1WTSHTBgdb75/zrMhy1eCWE84Nf8L9XzsClcJ3RRruXoHstql+s
	=
X-Google-Smtp-Source: AGHT+IFJZJXlbTxTZXXhHTdsE/6Gn1GSiXvhWGtuoPLrI0DDYz3oKTgiHSCt31+MLR5Qj4+DcGdtkg==
X-Received: by 2002:a05:620a:1262:b0:78d:6b00:4f9a with SMTP id b2-20020a05620a126200b0078d6b004f9amr491886qkl.37.1712861189946;
        Thu, 11 Apr 2024 11:46:29 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id pw5-20020a05620a63c500b0078a593b54e6sm1351535qkn.96.2024.04.11.11.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 11:46:29 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] arm-systemready: Change get_json_result_dir helper
Date: Thu, 11 Apr 2024 14:39:11 -0400
Message-Id: <171286075123.2560674.13239351585274862983.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240411094809.1685341-1-ross.burton@arm.com>
References: <20240411094809.1685341-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 18:46:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5532


On Thu, 11 Apr 2024 09:48:09 +0000, Ross Burton wrote:
> The get_testimage_json_result_dir helper in OE core was deleted in
> commit 01b1a6a5a4e7cede4d23a981b5144ae9c8306274 in preference for a
> common utility. Change the reference within the Arm SystemReady ACS
> log handler utlity.
> 
> 

Applied, thanks!

[1/1] arm-systemready: Change get_json_result_dir helper
      commit: 603d9dbfe4a7d0a12bb9f0b16e6fd576f4c2df0d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

