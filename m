Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1A0EB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 04:01:07 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.5586.1688702460368427740
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 21:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=rinETKuz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.51, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-635f293884cso9949566d6.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 06 Jul 2023 21:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1688702459; x=1691294459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnVuUWMFRH8PHlxmDuRgjcIzcQwQN5+RvNgbeWu/9Hc=;
        b=rinETKuzAeOPS+iz2LAnZWlXx/Dxov2M+3tL27QqQ7mfYcjaM4hQ0z/UXWOvsilDk2
         t9oj8zQJ5LpoFSBLmibcvKi4yJgiplq5klcuer2AA2y8/rhcaE8C65Q5vVwo4u71wCrv
         9dSXhYKmOR2IydIHaMwncHxFrNDlJHca3Xt0NGr/qA5Y2a4O4RBjZSz6tgKiJQkoxKpU
         9wsxbvP372+O2DxPfXNpvvK/jQT1jyRbxWeNsmZP26SnWl+PQqg/lojGr9F2EhzlVcB4
         17DlUVcGjCFg0cq6yi4lxP1XG2hxy4NJV+mYOHt87awlIo8G9ozhYRu5hUMAMNpDOFzg
         9Png==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688702459; x=1691294459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OnVuUWMFRH8PHlxmDuRgjcIzcQwQN5+RvNgbeWu/9Hc=;
        b=Q4M3DFhaIWyZ2pjTfd0Wna2P0jXRiB6dibUZP4jrz0f3pp+EkVGPW5ZcGpyWA9vPWQ
         aFZEgKE/8RMpsJ2gCeXYT22rpwsRQybgp3m+2arXoYFVC4tWpJvin02DcZFblNaK6PHp
         rinSiPuptvt7b4ZdbLp0I0xePHj+CPH/YuZeQ33c8OkB63b54gVfYpdTIQV2whvp5TWP
         Q8HJHuu1B4kE4i2IvVnAvHM90iQ+mtY0NSRNTOlLvBmLAOefYnBA3M4akVhsC2eUOvpW
         po/4458j6qLepwolVaYuHxkGcIxV965N4x6OJJA00dgjGMabJa1HyK1EZmNaVcBtY4z9
         VSsQ==
X-Gm-Message-State: ABy/qLbp3x1R5vKrbrJK0Xp1lOQ3+8/ZY9ZsKjVFg3qAdwgQwBDD+Qng
	7LSg2rBh37KtlJEcqcT76wFq7V+LUKOa3yyL1Vc=
X-Google-Smtp-Source: APBJJlGFXaygwdpDz3Fb7aume78owPGPA4VeyfHvhi4cKEa+XMZn0DTg8/ab8ic6SwJs3kuu0DEskA==
X-Received: by 2002:a0c:ab14:0:b0:636:34e2:fae1 with SMTP id h20-20020a0cab14000000b0063634e2fae1mr3686426qvb.20.1688702458923;
        Thu, 06 Jul 2023 21:00:58 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id o12-20020a0c8c4c000000b0063601efba01sm1644166qvb.111.2023.07.06.21.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 21:00:58 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com,
	abdellatif.elkhlifi@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH mickledore] kas: set the SHAs for 2023.06 release
Date: Fri,  7 Jul 2023 00:00:47 -0400
Message-Id: <168870244935.375012.7935557265356564405.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230706165208.1288867-1-abdellatif.elkhlifi@arm.com>
References: <20230706165208.1288867-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 07 Jul 2023 04:01:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4865


On Thu, 06 Jul 2023 17:52:08 +0100, abdellatif.elkhlifi@arm.com wrote:
> set poky and meta-openembedded SHAs
> 
> 

Applied, thanks!

[1/1] kas: set the SHAs for 2023.06 release
      commit: 559cd0359b97a444e119ca713ba61f3dc547d34e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

