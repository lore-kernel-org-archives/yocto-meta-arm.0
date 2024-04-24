Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB40CC4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 14:15:26 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.17477.1713968121701794008
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 Apr 2024 07:15:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=zSA+BrD5;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.171, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3c6088df378so1538188b6e.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 24 Apr 2024 07:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713968121; x=1714572921; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3WYiGTAGIG3kqupntd/hcAGA6gQp/rzMU8ocaPng3M=;
        b=zSA+BrD57sbRrb8R0ef9Tx30uF/WpZpmD/YhbrdgsQEFA5cIs53rk7Ag0Nt8KoS0wk
         EF4ym1pDgYtu9RtYbl3Sh2i2RoZtdeW7hPr44bEys1/90taId2RNHvC+1nuC3bxQU9B6
         Z4uW3e/JsaxnlUPTmQAVexTWMfLD19K4GfGTZXmmcsSH7lIiTEklBbS/lYZ/QJKgE4ZI
         NZocb70O8ZboFbzAdd4mdvTcAb05XSXXjs8W51DzhAf5gp+6GkMZc7Ad+duDTaOkgcDh
         Au7ajx5+GHmimj0oU2KLgXkq9zF7HBhPjiC+eAXhcXwPVlgIlohziKvuAcXXj0+bb1Jo
         pOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713968121; x=1714572921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3WYiGTAGIG3kqupntd/hcAGA6gQp/rzMU8ocaPng3M=;
        b=K1W+D4r32D3B66BpHpaXnhTH4V890UL/PqG6kcgRrQBllprS3SZ+4MG7U4J84IB6OQ
         tmCOkVe9cMTdx7QQwKzkGFtkJr800S1n1FGgqdYWaqLeJAVJqN2Dv9P5s6Qj6KMTuvw4
         +Bs+AGUwsFcfdpbC8O0zhXCu/y/4PB9bGlyfSWFSTdnBWM/mRQ7Nc4Nl2zG7tYLSmfFg
         DN/v6Dn0oX5oDvVyYz3SRsbUeiXdZbWBWrYnzxaYjXKKkAPWDCzgOUQlMYIyliKNvI8L
         qyqXwD2WIlAvuAa4CamwBFXR3vVMPLUuEmU4fqcnGm2NNxQ/Swx1ZiiHlrNyhl2wbyC4
         KUrQ==
X-Gm-Message-State: AOJu0YzyUR9/i/Cg6MnV0XwYCnjBUb5JbSGMUgNw4UvzF1Emb1LBbfC0
	blfPNdE2++RkvbK0b1GcVYGcHsXjr20mx0y/8OEr4+KklYZOYJFRu+7lXj/vpbhaCKgTelt1prE
	=
X-Google-Smtp-Source: AGHT+IHfUqTyrbyiIciCkAstuafPhsbpuSKM+9NgUegCRopeGtgf5LQsQy0SF1KFNLV66C6j/KFZ/Q==
X-Received: by 2002:a05:6808:ec9:b0:3c7:2a88:ed6b with SMTP id q9-20020a0568080ec900b003c72a88ed6bmr2956296oiv.5.1713968120872;
        Wed, 24 Apr 2024 07:15:20 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id v15-20020a0c8e0f000000b0069b4ddcbd42sm5244663qvb.0.2024.04.24.07.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 07:15:20 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] arm/classes/wic_nopt: remove unused class
Date: Wed, 24 Apr 2024 10:12:30 -0400
Message-Id: <171396794978.193657.9373675774592623009.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240422114403.75657-1-ross.burton@arm.com>
References: <20240422114403.75657-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 24 Apr 2024 14:15:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5606


On Mon, 22 Apr 2024 11:44:03 +0000, Ross Burton wrote:
> This class is no longer used by any machines, so remove it.
> 
> 

Applied, thanks!

[1/1] arm/classes/wic_nopt: remove unused class
      commit: 11b8298439d95641ee92f63d331d2bf82748c42f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

