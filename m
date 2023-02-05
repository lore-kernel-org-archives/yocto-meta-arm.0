Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB139C636CC
	for <webhook@archiver.kernel.org>; Sun,  5 Feb 2023 10:00:16 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.26181.1675591216204631680
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 05 Feb 2023 02:00:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=sAQxkdNn;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id jf11so5515426qvb.4
        for <meta-arm@lists.yoctoproject.org>; Sun, 05 Feb 2023 02:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miYcmm6UF75RfYcr/g+1LZINw+qHyfPGnAvc9bS9yJA=;
        b=sAQxkdNnBlCv6XJ4hWxFxk8qZzdmUMMwI8i+9JBnakh7sDoWCPstM0QReYAsbb12rF
         +5u2nHc9nWpuBMyW5AmCRYxZ72nAaXJj0Ym5YRF1NJQhngB06ARUw7j92HOoaBELJ2MN
         mz3DD+QVL87du4KYuE7Z1sbzAssRmDLjS+qJhnWnG8nWFrZL+gmTm/MgkYvu7QHxZJhs
         i2h22SAyzB46fVdmmCqS0MrTenZ2KmzNDvO3et9PE9JsinC769uTIGeVfvITKID+JUsC
         TLnAAnj1JS/n8fbLphouW3U/B4+GCF5QhWy3DIWV7HSJisgmyILO0DaOjALPwTbfZMIT
         3fOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=miYcmm6UF75RfYcr/g+1LZINw+qHyfPGnAvc9bS9yJA=;
        b=4HZde5ryVxX2mpqQRJStxq8IZC5HLIZxPEw5PsTZdKoeSZXPwCl487ohXHqdgmxsSy
         tYZNqUX+4aAOFNz1xJEBwaALF9foygBzCEC51TVADD8/WDh4icjA9K/AZ6z9xU/uCyQL
         KMDyWAQH02cujiPgtR1AxzH9A3tUmMUdAKBlnOSpbcNCCcZSnvVZLPZOPXEIEph3fg2F
         sjrmjapdJMkG+hGnpcAQjJ1Z4mQty/vb9CU0dKnaD2rujGoYguA5cQ+7dQ4duIj6pslK
         Rrr3De/XqfK5cxju1IZDEFDPLZGPyBQLiRY8wZnqqqrNTqq+VoSIxbIsTk8RIL9rQfsz
         g1VQ==
X-Gm-Message-State: AO0yUKV5x5oiQ706hm+NR6J+RNaVt7Agi49Sc2udpZpYSBEkX2+j29j+
	74WuBovct1Q4Q5nnlWwru/WIe6n6GHy1yWynDe4=
X-Google-Smtp-Source: AK7set/NXxvuPSI8t3vbGVxEc8JSn8HerO5n5b8nfzZJv7zn/I2mobCUsqdemEUm2n2Q11NMQMDltw==
X-Received: by 2002:a05:6214:449e:b0:537:7bd7:29d4 with SMTP id on30-20020a056214449e00b005377bd729d4mr29420771qvb.47.1675591214819;
        Sun, 05 Feb 2023 02:00:14 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id x8-20020ae9e908000000b0072526a43ef7sm5220150qkf.120.2023.02.05.02.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 02:00:14 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Qi Feng <qi.feng@arm.com>
Cc: Robbie.Cao@arm.com
Subject: Re: [PATCH][langdale] kas/fvp-baser-aemv8r64: Use langdale as kas default refspec
Date: Sun,  5 Feb 2023 05:00:08 -0500
Message-Id: <167559120878.1751652.5724283407465307874.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230201102432.82144-1-qi.feng@arm.com>
References: <20230201102432.82144-1-qi.feng@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 05 Feb 2023 10:00:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4361

On Wed, 1 Feb 2023 18:24:32 +0800, Qi Feng wrote:
> The default refspec for the repos used by kas is now langdale.

Applied, thanks!

[1/1] kas/fvp-baser-aemv8r64: Use langdale as kas default refspec
      commit: 85746671a4eb520c0dcf0caf4905a8c4fb85dcc5

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

