Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7A8C4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 18:14:43 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.3539.1668708873810835516
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Nov 2022 10:14:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=FBKSuvNs;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id a27so1611500qtw.10
        for <meta-arm@lists.yoctoproject.org>; Thu, 17 Nov 2022 10:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=osn9s/bky1RK9md1F9NPlRbdgbY/PsTKVxQ9EJ8ftKc=;
        b=FBKSuvNs1VnyITZjhzF1c3FBMRZvr1KUk7tUiILsr+u2KwEmCGcQMCfmaWkiBlxm9g
         oq2FmL56CH0N5HCZphqe0qSJOaCPg+VjEhsTX4m1hfcXJ6Q7p+JRrXHCsbVUPQYcFKK/
         6fmHotge/K3qvSiCag2PczViBIwoDfFZ6TTqAUTkRJo86DDeabtSuAj92u8RUXVHzNPh
         LaAaGXjsih3EsKpTeieaESXgUU9I7A830IvMK2Q7mvBXjYI7ioI9NNBUZb64cVDB/3UO
         JjfMiNgpGHOGnSVpOmZEz4MTlkXE7/HzhEMzWoxfmR8U21wurQ2VGmZrsqUPnRARKY+N
         d5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=osn9s/bky1RK9md1F9NPlRbdgbY/PsTKVxQ9EJ8ftKc=;
        b=DipLGkcKJMd0g308mzhvKdAiqe/urM+Jiyb5XC/bauLLlqxrbJuz9lkeexevnynfOM
         IZTTPsiVamwXA609PewsT+GQ3eRhEWKyejrRAGeblQcZCIy3bKPqZngJ+pNKUmB1gIeX
         1BpXnbIfkctxmFj6XHSpQ5RnjQbNHNPuey843bx44qoyxBWEUjJ+fOjzWjJaV4RVoanL
         Ijz84NTN4lcvKaIg8pQqJX88+/cWYtELBfR3JYvo9l6VNMHBe9QxwjdDVnzoy+5bWAsU
         qb8Z00pHhCEAtjEdTeDvcbKNaptT8whp1pTKFlg/xA2GwjkFD4mOH7mZ3GlnOeJQB2EW
         KtXw==
X-Gm-Message-State: ANoB5pmd4OlHXvhEs81XDz9XggJJ+HmRqo/Hz0Ev1ZOKygONHadWnQKH
	fB7DSw6/BEwhUTZFZGI6LKyq02PQVwh6Hw==
X-Google-Smtp-Source: AA0mqf7JWuIGbkfACoMEkzwhPTCjOflTLI50IkfR6eLkLc57J/Pnpj73Ly7ODnS95ga7txqkVpak7w==
X-Received: by 2002:ac8:5049:0:b0:3a4:ea2c:c7e5 with SMTP id h9-20020ac85049000000b003a4ea2cc7e5mr3314785qtm.257.1668708872481;
        Thu, 17 Nov 2022 10:14:32 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000:24f9:d5b6:38a7:110])
        by smtp.gmail.com with ESMTPSA id w9-20020a05620a424900b006ce2c3c48ebsm897271qko.77.2022.11.17.10.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 10:14:31 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm-bsp/trusted-services: rename bbappends with git version
Date: Thu, 17 Nov 2022 13:13:54 -0500
Message-Id: <166870883526.1674481.8758670924970040521.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221117165941.26145-1-jon.mason@arm.com>
References: <20221117165941.26145-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Nov 2022 18:14:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4138

On Thu, 17 Nov 2022 11:59:40 -0500, Jon Mason wrote:
> "git" is the version and need not be part of the bbappend name.  Since
> this isn't being done in any other part of meta-arm-bsp (and not
> uniformly in the same directory), rename the bbappends to have the %
> wild card.

Applied, thanks!

[1/2] arm-bsp/trusted-services: rename bbappends with git version
      commit: a68a2a206eeb1427b4217b8831439cbe56341a14
[2/2] arm/trusted-services: limit the ts compatible machines
      commit: 7b4c17632d07044c1a580a90f20a2dbca3310fe6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

