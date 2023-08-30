Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06ADFC83F14
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 22:38:32 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.4198.1693435105744561198
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Aug 2023 15:38:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=F6MP6sAO;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-64f4ac604c2so1269776d6.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 30 Aug 2023 15:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1693435104; x=1694039904; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLWFO0HT7BpxZKMBt9wMLqiRumWzofN+Nve44Fidizk=;
        b=F6MP6sAOqw/0qm9uksDu3jAesBeUq4qBkXchJikV+lWQeK7MZIzU5pF5T7jh2ulSz6
         3i26vpCAwaXV7w+SU8TGP1YvSmOMbZwM6SswQMKiSXq0UJq4iKjZFsmbdusfgbInDEQH
         mbRjAmA1LvgOdDNlujojSGAx/PhPXA90gLVuSZ7xQYnD/vpOqhZCit6N5QkPvG+/7q/x
         Az8E9YPeWc7rU0eJe4eGRbh0rIWpAs0uUOo3gkkuA6EtPJrrbDsrKhPeaBhFCG+xCosn
         phxJB3O2I/KDV3ZlNKkBWfRhrIe12vqO6QyPyw1ExiyF1ksKS5p9R9ZAadsKmvGa/U0y
         uf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693435104; x=1694039904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLWFO0HT7BpxZKMBt9wMLqiRumWzofN+Nve44Fidizk=;
        b=KqTc0eoL4c3Zi6DfVtaYWyhS8TxvKgrj7rZfXIw+McO5zJwwHHa3xtw4br+ho8l5pD
         L+tmaVCABYlO3dFaIXavlGpLeGlSFEZ9UooPXUPhu4rBU6Bq5u5D8b+7x/KehPhDEQlt
         FQ+ILIDQgLnOlzNPpuzTGdt3WbYTSQKeofq16mZoX2TYQ9kYMWN7txnBz8dv77ZXnFRg
         prQ9GRAzXzN0sTzwyfkPWxBqNtiaWAO5/SajYeIUXyHpozCxp0fCgPvTpIAmXfGE8XjC
         wGKfb0pYpjZGeE1ZUUvkqw6PySwdFmjcTxIUCjCkmJkpe0rMGkyXSuB4Kxuu/Ys5mQpu
         +8RQ==
X-Gm-Message-State: AOJu0YzYqLLtIkueAwtmbDvJEnQmiONukL0vU5LSsDOc1TvxuDZpzxSD
	DXlBOb/PfZcUkHo5Hvh1WTHWkw23qAPleN8bsSs=
X-Google-Smtp-Source: AGHT+IHgObB3q7sqYmCMYQKaJmXz7uZenb/Gk36jEToC2TuZNOsPNSpemgexRXR9+fnrcLeVRwYCCA==
X-Received: by 2002:a05:6214:4505:b0:64f:955b:8b75 with SMTP id oo5-20020a056214450500b0064f955b8b75mr973013qvb.59.1693435104216;
        Wed, 30 Aug 2023 15:38:24 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id f4-20020a0ccc84000000b0064f77d37798sm29440qvl.5.2023.08.30.15.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 15:38:23 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm: patch clean-ups
Date: Wed, 30 Aug 2023 18:29:13 -0400
Message-Id: <169343455401.120020.17191989660074344131.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230830183850.3694447-1-jon.mason@arm.com>
References: <20230830183850.3694447-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Aug 2023 22:38:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5010


On Wed, 30 Aug 2023 13:38:50 -0500, Jon Mason wrote:
> Clean up various patches by
> * Create email headers for those not present using the s-o-b as author and date
> applied to the tree as the patch date
> * regenerating the patch name via git rebase and format-patch
> * replacing patch with backported version
> * moving patch location to be more accurate
> 
> [...]

Applied, thanks!

[1/1] arm: patch clean-ups
      commit: 0b25c07cf2cbc9494bd059bf27236d5cdf04a0c2

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

