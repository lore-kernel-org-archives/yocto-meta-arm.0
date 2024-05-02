Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12B9C25B5C
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 14:13:46 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.14610.1714659221942274653
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 May 2024 07:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=epbbnsAW;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.42, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6a0ff97a9c7so7488086d6.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 02 May 2024 07:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1714659221; x=1715264021; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEf0jIIjE99ECzguWm83jauKqdWx/PI62oFTEUB++/0=;
        b=epbbnsAWF+oJNMqyAqEXSjcdviTe915+QSrFdpFosv9jLClUZsjgHql0WJQPeUU/OK
         txeg/0/gs/FyD7LIuvr1xr3aCMoaqvz6rP0jfeXqUUOWoD6HlvoqE9zi5OYH4r+6dd1q
         SEAJk2F1RfQZwW/FX3GDL+zCeVjrid4GUhVVq4GnomCxvrL8NQvFha7uCRfDr4jz3mho
         OFk4EBXPWHWzsvyDg+d8Vpkx/9HFqb8QZ7MN3+J3qsKn7HppW6STGUlpU6+LvD+f67yN
         HgRicQ7qo3xvjKQIPrfJQRDQK+kDkT6jER+uf1xQfgZ0GgsNwzjxZobDDYEKdDRxbveV
         zB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714659221; x=1715264021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEf0jIIjE99ECzguWm83jauKqdWx/PI62oFTEUB++/0=;
        b=c72BzeMuV4mCPUPw7AkezyPLvGtVh69RforODCEXtwEjbucjrEtI1KXeTxehagDoQp
         WzV6YBN81OH/U7TSgJ0L3uRIUkob/Cxy8ECg+8U2SXjBP9G2eB0Xi4Edrd1A1RXaRDcp
         TYPuFn5/09ok9yxzcVOKC+6mmskFttRsj1METU7W2Ziz2aHsqcOd46j93BCCP3fADB3R
         h8ob+atJfgCueKImZRy4Ww6oR6+w4v7Ywwxu5QHbkBnodDdrtqGI/zH9PRfelxm7KQlP
         SqxU82NmTxt1Jqv5s3Hrao/YWfnQGGi4/Eg387dN3tJM0XER4TVQkUUrKLKbAmgZ0NZc
         9mRg==
X-Gm-Message-State: AOJu0YxJILMP0s7eeZ2irn1o7b/lt6HKwOq3dXgC9l/0GxOmdGcKW0b/
	0DUcVoC/Or3NLn/9KMdwbndmPaMODkAKGeei4VWyiMv3wq1armseedYwz9381eLrQ3oTn8CF59Y
	=
X-Google-Smtp-Source: AGHT+IF7unUP8ZTP83evddUpm8F9WXDm2Eubn1uWjLNR3YZCFI+teyKnItJo2i55nIIilihv61bvww==
X-Received: by 2002:a0c:fac6:0:b0:6a0:ed35:15f4 with SMTP id p6-20020a0cfac6000000b006a0ed3515f4mr5338980qvo.14.1714659220962;
        Thu, 02 May 2024 07:13:40 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id a14-20020a0cefce000000b006a0fa61359asm383450qvt.41.2024.05.02.07.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 07:13:40 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/trusted-firmware-a: update to lts-2.10.4
Date: Thu,  2 May 2024 10:13:15 -0400
Message-Id: <171465919487.3706898.11816490987856730617.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240501123133.62536-1-jon.mason@arm.com>
References: <20240501123133.62536-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 02 May 2024 14:13:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5688


On Wed, 01 May 2024 08:31:33 -0400, Jon Mason wrote:
> 


Applied, thanks!

[1/1] arm/trusted-firmware-a: update to lts-2.10.4
      commit: 3574ae46d7904add360ea7d68f049e6730df842c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

