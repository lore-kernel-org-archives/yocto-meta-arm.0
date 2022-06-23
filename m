Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76C6CCA47C
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 17:15:26 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web09.484.1656004523633826961
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Jun 2022 10:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=Y3B/eNWm;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id i17so265051qvo.13
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Jun 2022 10:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qYODjOlpPtKy1ZH1MT3vBLvcgYbQwxWQce4M3f4N9y8=;
        b=Y3B/eNWmrtYjqq97zpeTRPGf1NHU/jqmKqxrg1CApklOvuz1giAAHdXGKDLJbA4494
         M6a5eK1LryJ5+7UkFmfRfELRfVZGFWKpr41I4vpbVEMXzW1OtkGigWP2efDqc3dh7Wwd
         BEtz31r2FIX43KNEYXHjXcpSpEITLlWaTiHKFPyWGFPE6tRWhJwPmcYoPUG8oIGKUVz8
         Vqk+GhCJt/oiZeQYHn5YHRiChOhohWbiGfsFjQsL+rqbP43F64F25H3O0YCSaza4f3TT
         VUzLGuDihWQ2bryVnQPlVA6XFqktcdkF4t8ehhFpubdJKPltV9fSnqo0GjLDFlaTaBC+
         XLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qYODjOlpPtKy1ZH1MT3vBLvcgYbQwxWQce4M3f4N9y8=;
        b=k4mDzgS/4bi5dw56tS03f6/5FxHSGdFeYhEiczMrbPmCaL3SoZh2M0PPuezJVxDywd
         q8IvMLoEY5AJWSBDh02xjWF25Rp7GDj5SPxz+F/tA1jQ4dCfJ5THB2xbiw5DXqr5XT79
         XqY9OW3KNg0JNZuffVygZZVJO4S52NckVgixt7J1wMs8o6jkzVNch88D6yq3R8k/VZyC
         PA6C1gXQVUM5dMfyf98tQMOpWZWUOxUbtLOlWiTC7o/ikW/igfdWblhlW5cObAqjsYeI
         9iCLpf4nHP91CRxTgN+9jQvfypO/ykuhn8uShFNnrTQG35APV5+qjzslVaFeF5pGM5Oh
         DUVw==
X-Gm-Message-State: AJIora+Iyt3y9JrppajQjDNBmQkvsJVcvvonRBaBH56KFqER0UpuKjdR
	oBsaqyuf8fzLjEXji+k0sXRF4yfd6WKFqg==
X-Google-Smtp-Source: 
 AGRyM1uWDGvNA+Em93Cb2kYcn2BKI3KqhMIcEZIL2I5p2h05zI3oxs4atsO1bvc/CiONu9goMAQuHg==
X-Received: by 2002:a05:6214:d0b:b0:470:4d68:f with SMTP id
 11-20020a0562140d0b00b004704d68000fmr15168710qvh.111.1656004522241;
        Thu, 23 Jun 2022 10:15:22 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 d2-20020a05620a240200b006a37eb728cfsm98919qkn.1.2022.06.23.10.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 10:15:21 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>,
	diego.sueiro@arm.com,
	jiamei.xie@arm.com,
	robbie.cao@arm.com
Subject: Re: [PATCH 1/2][kirkstone] arm/fvp-base-r-aem: Upgrade to version
 11.18.16
Date: Thu, 23 Jun 2022 13:14:53 -0400
Message-Id: <165600449335.3410853.2580675875755041586.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220622133909.1526025-1-peter.hoyes@arm.com>
References: <20220622133909.1526025-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Jun 2022 17:15:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3536

On Wed, 22 Jun 2022 14:39:08 +0100, Peter Hoyes wrote:
> The new FVP includes the arch in the download filename, so refactor
> FVP_ARCH in fvp-common.inc to make "Linux64" available in the recipe
> file.
> 
> Update version and EULA URL in documentation.

Applied, thanks!

[1/2] arm/fvp-base-r-aem: Upgrade to version 11.18.16
      commit: 741509023867aa629f35289bba12485d4b6e3dcf
[2/2] arm-bsp/fvp-baser-aemv8r64: Use secure hypervisor physical timer in EL2
      commit: 32ca791aaa6634e90a7c6ea3994189ef10a7ac90

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

