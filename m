Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE11AC54EE9
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 00:40:59 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web09.2609.1663893656811867607
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Sep 2022 17:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=rK9yfk2y;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.174,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f174.google.com with SMTP id w2so7503445qtv.9
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Sep 2022 17:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=9niCak0hTFtXANSlk1ErXqcIXqKa2oncf4Ta7gqfbPY=;
        b=rK9yfk2yjy96yEIva85nzAU4vElyVQhS41RIYdgNTloaRyjIm5SQOOVvyyA1UdrYHn
         nZqmi2ZFknYBif5bZvtsS5sLm8c9+8HFdjgIZ9suwtknbcpfooqOfHTSpMVdBysB36Fn
         9ynK/CpwjYnjXIaW9zaN/kMkX9rlPR+kShPMxZoc3rEtOMcJKFAIVh8rjOsamP51U6Gp
         YTNUBK1CyPHJsfoffByFWb7mp2NxaX4+NJXi4tcspJhN/61HVvZR7m4q2Iv8LVQ0TTk3
         QgtZxV9igrwKIqrOqBhQQbHCKh6eltZfY9CVUsaZwzp82BGxlkyIU3mt2cl55klPfFHs
         l5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=9niCak0hTFtXANSlk1ErXqcIXqKa2oncf4Ta7gqfbPY=;
        b=nRkVSgghAShSwMgWcOSiHEZzfYDADCmWGzGq4K8CUsXUdQ6oAZvcsVsW7O1OjEWHYA
         4vrz9HcIddppz3PAhFdJ/nkOp/WLJp6ayF7wpo9dcmnFYES0KLeN2HeF1gLV3vD5obS3
         t2d/bI1bK/S/wKVMcNkFKrgRS2S2y7HOpft9qTuaSMgcsXNNgJPcaX+9EtNFglb6bq44
         pyf+oeNuPw2Adfi527KZHtnfhE8Y7ANIQyIQFi+Sczqd9PD8VLb4EBRDkOfGsSW1CKSx
         Q7HTNd/dcv40Hs0r/E4fvhbkRVGLBGBoHnM67K37uwKK4u70dVEZUMvYBqv/c6V4P3Yx
         q6bg==
X-Gm-Message-State: ACrzQf2sjaLlZKpJnWCvXyJPKw2JQDjEIb6LKttksP3a2RU6AzvZyLkS
	gmNu8exd15BvHugWtjxpTDX8hg==
X-Google-Smtp-Source: 
 AMsMyM7DzfUG9/ApzuAfjFl0O3+NoRVYHYTSCYsV8mp6+gTMJCRWb6nMtr0lE3FHfFEof4b5eU0cig==
X-Received: by 2002:a05:622a:15cd:b0:35c:c425:bcd7 with SMTP id
 d13-20020a05622a15cd00b0035cc425bcd7mr5241523qty.156.1663893655827;
        Thu, 22 Sep 2022 17:40:55 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 x15-20020a05620a448f00b006a5d2eb58b2sm5131000qkp.33.2022.09.22.17.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 17:40:53 -0700 (PDT)
Date: Thu, 22 Sep 2022 20:40:52 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH v2 3/4] linux-yocto: Add bbappend for 5.19
Message-ID: <Yy0AlN5vMSG63Ndd@kudzu.us>
References: <20220922005409.3378701-1-raj.khem@gmail.com>
 <20220922005409.3378701-3-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922005409.3378701-3-raj.khem@gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 23 Sep 2022 00:40:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3814

On Wed, Sep 21, 2022 at 05:54:08PM -0700, Khem Raj wrote:
> Enable tee and arm-ffa driver on qemuarm/qemuarm64 by default

Per Anton's comment, I don't see why this is necessary for
qemuarm/qemuarm64 by default.  Can you explain a little more please?

Aside from this, the series looks fine.

Thanks,
Jon

> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Rebased
> 
>  meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend | 9 +++++++++
>  1 file changed, 9 insertions(+)
>  create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend
> 
> diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend
> new file mode 100644
> index 0000000..7dec2f5
> --- /dev/null
> +++ b/meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend
> @@ -0,0 +1,9 @@
> +# enable arm_ffa regardless on 5.19
> +SRC_URI:append:qemuarm = " \
> +    file://tee.cfg \
> +    file://arm-ffa-transport.cfg \
> +"
> +SRC_URI:append:qemuarm64 = " \
> +    file://tee.cfg \
> +    file://arm-ffa-transport.cfg \
> +"
> -- 
> 2.37.3
> 
> 

