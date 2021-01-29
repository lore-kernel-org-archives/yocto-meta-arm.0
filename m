Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web09.5872.1611898710631981308
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Jan 2021 21:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=n5b3/ivx;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id h7so10857556lfc.6
        for <meta-arm@lists.yoctoproject.org>; Thu, 28 Jan 2021 21:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g4eeEDzL+PH2EEK6CSq2FxYWD7c1tt73XhiBXMi5w54=;
        b=n5b3/ivxPNW3yIPh9xrDA4vHPYtPP2lfawtDnZALRuU74bQPJ/uFTXxVIYNF6afG92
         OW6Ow3fAVTmHSphN/FXDndEX/DES4PMdCzYvdUyhDcSjOcabYi43D2eKN6hyiWCEWEIw
         IfrVux18EDbfCQOp34cZ3iUUfOZelukreH32CWdMEwLQHUL5Dgm5kM90tIu1plhm77Ud
         i//vV8ZHrVMtQe9EDLZhc+M73J/a36cVxl5NiBN8XZsVtUqeG6LkcqsWuEdC+swiw6kq
         jIQ3IjQqaHFfWOrniBCeYoASyrCsWU+mTQjm6uoyFJqDgnBA/WyI+g2ou9LyzvZe7CB9
         24Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g4eeEDzL+PH2EEK6CSq2FxYWD7c1tt73XhiBXMi5w54=;
        b=EhegWVg1qc8Pza0vvOWaEmjcPw7gxDY+TkcIFKaOKtVYaexenx9caKrZ8tEzoeXchX
         7SMwpRd6MXnMeh5TUHT6XqN0TOS0oUiOAl/48Bf3dYr6u8g06x79GToZSoow87Pxwtk1
         c0puDblLbCrt2M2+audnScGO8WjrrvSwLZiqxhMWkcg1FkT04A+IU1zvKqDbHVb8qDqr
         aox1sb5r6KD84hfEXKdyh5g9Z7RYNbiZF8YNLAyE23EZnQ1c8LWUdLvtgeL+vyMrXlH5
         qZ+Fdy1/FiOlucWS+LJehzOEDLFM0soXrrGdLtPwWutniWyn0qfvPZAMA7sbteAtuSA7
         eX9g==
X-Gm-Message-State: AOAM530Lhjrik8ZxBV6CpWmgAXy0Zv5AqoUrP47cOt75ZLjYqfTSzznU
	jx9U6UI+EXbccYmfT+L6uO0pnEiNLC9fj3GUjaWamQ==
X-Google-Smtp-Source: ABdhPJy5rRdyD7bpMJAAMiPvwyZTfOQAaDsmqdjByrlKwV25Sf8D6fm88Lg2NOS4tXL8mI8LiAxBbUzIlL1lpcHj6mc=
X-Received: by 2002:a19:456:: with SMTP id 83mr1320894lfe.113.1611898708691;
 Thu, 28 Jan 2021 21:38:28 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sox8e6OgAYwzPSinah7kk6YcYbn6HRUZFgd_H5C27Ss=A@mail.gmail.com>
In-Reply-To: <CAMKF1sox8e6OgAYwzPSinah7kk6YcYbn6HRUZFgd_H5C27Ss=A@mail.gmail.com>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Fri, 29 Jan 2021 11:08:17 +0530
Message-ID: <CAFA6WYM8oqCJHruVB2eco5y6VddY7nq_P6HyKQVdOEJteXjKzw@mail.gmail.com>
Subject: Re: [meta-arm] preferred version arm-8.3 of gcc-cross-aarch64 not available
To: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>, Jon Mason <Jon.Mason@arm.com>, 
	meta-arm@lists.yoctoproject.org, Cliff Brake <cbrake@bec-systems.com>
Content-Type: text/plain; charset="UTF-8"

Hi Khem,

Support for arm-8.3 was recently removed [1] from meta-arm master
branch and it only supports arm-9.2 and arm-10.2 releases. It looks
like your distro has configured the preferred version of GCC as
arm-8.3 but it isn't able to find it. Could you check the value of
"GCCVERSION" variable?

[1] https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/?id=a56011bf30c86a86c4feb57827030516c37f65ed

Regards,
Sumit

On Fri, 29 Jan 2021 at 00:14, Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi All
>
> We have started seeing this error. It seems related to meta-arm. We do not want
> gcc from meta-arm but it it still trying to creep in. Please help out.
>
>
> https://github.com/YoeDistro/yoe-distro/pull/518#issuecomment-769242387
>
> Thanks
> -Khem
>
> 
>
