"use strict";
var KTAuthResetPassword = (function () {
  var t, e, i;
  return {
    init: function () {
      (t = document.querySelector("#kt_password_reset_form")),
        (e = document.querySelector("#kt_password_reset_submit")),
        (i = FormValidation.formValidation(t, {
          fields: {
            email: {
              validators: {
                regexp: {
                  regexp: /^[^\s@]+@[^\s@]+\.[^\s@]+$/,
                  message: "Vui lòng nhập Email hợp lệ",
                },
                notEmpty: {
                  message: "Vui lòng nhập Email",
                },
              },
            },
          },
          plugins: {
            trigger: new FormValidation.plugins.Trigger(),
            bootstrap: new FormValidation.plugins.Bootstrap5({
              rowSelector: ".fv-row",
              eleInvalidClass: "",
              eleValidClass: "",
            }),
          },
        })),
        e.addEventListener("click", function (r) {
          r.preventDefault(),
            i.validate().then(function (i) {
              "Valid" == i
                ? (e.setAttribute("data-kt-indicator", "on"),
                  (e.disabled = !0),
                  setTimeout(function () {
                    $.ajax({
                      type: "POST",
                      url: "/password/reset",
                      dataType: "json",
                      data: {
                        email: $("#email").val(),
                      },
                      success: function (data) {
                        if (data.ret == 1) {
                          Swal.fire({
                            text: data.msg,
                            icon: "success",
                            buttonsStyling: !1,
                            confirmButtonText: "OK",
                            customClass: {
                              confirmButton: "btn btn-primary",
                            },
                          });
                        } else {
                          Swal.fire({
                            text: data.msg,
                            icon: "error",
                            buttonsStyling: !1,
                            confirmButtonText: "OK",
                            customClass: {
                              confirmButton: "btn btn-primary",
                            },
                          });
                        }
                        e.removeAttribute("data-kt-indicator");
                        e.disabled = !1;
                      },
                    });
                  }, 2000))
                : Swal.fire({
                    text: "Đã phát hiện một số lỗi, vui lòng thử lại",
                    icon: "error",
                    buttonsStyling: !1,
                    confirmButtonText: "OK",
                    customClass: {
                      confirmButton: "btn btn-primary",
                    },
                  });
            });
        });
    },
  };
})();
KTUtil.onDOMContentLoaded(function () {
  KTAuthResetPassword.init();
});
