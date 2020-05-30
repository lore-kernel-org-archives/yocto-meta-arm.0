Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.4241.1590872918469375628
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 30 May 2020 14:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=0VV962aF;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id j32so4838166qte.10
        for <meta-arm@lists.yoctoproject.org>; Sat, 30 May 2020 14:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jQdauc8q9a1ARW7ug/jwJalKvNEmLKsuGJg3iZXDcUc=;
        b=0VV962aFNNDV6cWX32EALVhq+wy5Ij8s3nppdUKgVfHkS1DG3L3HzaOuOpGkXIlCzE
         Vobl4oFoQify3xJtvIrLnNhz6yNuiRSwLgqoF2W4T+Ow7+YmaXpa5uWtW4ZNrN0+Ykpe
         zyT9V4EhlLIqKb6obxgteEq/BjMOMSBOONpHzbD+tnYxYgpXt0Krk2J+O60owlGOTR5n
         Kbbdd4IUEIC4lm42HAnzT1hayZtpvRTJ2SZYxlLWkvNIFDBMzRKy4zC1ynCwM53dXJGx
         S8fV7uDU54u6+Ezj9+dP30gUvPJBvtjbFFQhYa8lmTQIoBkZlgntcXBVoWcYkduMoEUx
         zc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jQdauc8q9a1ARW7ug/jwJalKvNEmLKsuGJg3iZXDcUc=;
        b=VJNqBk4kdULu7Jn4rI0MxpbI8PgjnqOma2ryrKXENn9z3UR/L+t6Djyqt8HABPDJDn
         uM58Qe7uI7KPcxMvK/rDOKj+UpsyVXrxs3RhBlI+2cau1lky/VqoUpjQtjxvwgzJs20d
         v/+FjDnIppAGbWbxsl6nZjqD9SAtniTcxzP9+DMc0rduiYuYttFrDtQbKTlPHFE3eCH5
         Ju4zZqBiIpGlRvlNn+khJd1W/jQYfIhyiiYIn9Fr2IeXtv9tqAr90VKKEai+CI155YzK
         NXXDJGlUa7SiSlSZqNALazUVk3jnQIIM5CVPKhAsJfkkCNIbGdp4z01ceq3BQ5P6xyWc
         NTjA==
X-Gm-Message-State: AOAM532EaUZHNpComilryu7a9bYjuwIAWhUnY5BbbPZErl8OHUl5gSuT
	LWtFZObJNhZfApFft2ohXAM8+g==
X-Google-Smtp-Source: ABdhPJyMavm6DFs5nf1UH1CC0iYFSO3oHjhRGV6Dnnr4ZzYyCL1n9P/tF2N88paZySlwmgybpWpAYA==
X-Received: by 2002:ac8:5301:: with SMTP id t1mr13179464qtn.310.1590872917538;
        Sat, 30 May 2020 14:08:37 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:40c5:f228:6bc6:252e])
        by smtp.gmail.com with ESMTPSA id s74sm10391381qka.54.2020.05.30.14.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2020 14:08:37 -0700 (PDT)
Date: Sat, 30 May 2020 17:08:35 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: Sumit Garg <sumit.garg@linaro.org>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-toolchain: set CVE_VERSION to fix cve-check warnings
Message-ID: <20200530210834.GA4620@kudzu.us>
References: <20200528140737.23411-1-ralph.siemsen@linaro.org>
 <CAFA6WYO4c3rHboqfppR+-h_Cjy7trTypfYm7Bikf6hVMy-jJUw@mail.gmail.com>
 <20200529142830.GA20456@kudzu.us>
 <CANp-EDbxdvHMh4nVYKzDaJ1foTYWV64WSnkcYjFsL+YRs2e3DQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANp-EDbxdvHMh4nVYKzDaJ1foTYWV64WSnkcYjFsL+YRs2e3DQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 29, 2020 at 02:28:12PM -0400, Ralph Siemsen wrote:
> Hi Jon,
> 
> On Fri, May 29, 2020 at 10:28 AM Jon Mason <jdmason@kudzu.us> wrote:
> 
> >
> > Applied to the master branch.
> >
> 
> Great, thank you.
> 
> What is the process for applying it to dunfell - should I send another
> patch (only the subject line will differ)?

It is sufficient to ask me here :)

Thanks,
Jon

> 
> Regards
> Ralph
